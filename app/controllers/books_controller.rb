class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authorize, only:[:edit,:update]
  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    @books = Book.all
    if params[:search]
      @books = Book.search(params[:search]).order("created_at DESC")
    elsif params[:search1]
      @books = Book.search1(params[:search1]).order("created_at DESC")
    elsif params[:search2]
      @books = Book.search2(params[:search2]).order("created_at DESC")
    elsif params[:search3]
      @books = Book.search3(params[:search3]).order("created_at DESC")
    else
      @books = Book.all.order('created_at DESC')
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    if admin_signed_in? or librarian_signed_in?
      @book = Book.new
    else
      flash[:notice]='Student cannot make new book'
      redirect_to '/students'
    end
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    if admin_signed_in? or librarian_signed_in?   #check librarian associated library
      respond_to do |format|
        format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  def bookmark
    @book=Book.find(params[:id])
    @bookmark=Bookmark.where(:student_id=>current_student.id,:book_id=>@book.id).first
    if @bookmark.nil?
      @bookmark=Bookmark.new(:student_id=>current_student.id, :book_id=>@book.id)
      @bookmark.save!
      flash[:notice]="book added to bookmark"
    else
      flash[:notice]="Book is already Bookmarked!!"
    end
    redirect_to action: "index"
  end

  def unbookmark
    @book =Book.find(params[:id])
    @bookmark=Bookmark.where(:student_id=>current_student.id,:book_id=>@book.id).first
    if !bookmark.nil?
      @bookmark.destroy
      flash[:notice]="Bookmark removed succesfully."
    else
      flash[:notice]="Bookmark not found!!"
    end
    redirect_to action: "getBookmarkBooks"
  end

  def getBookmarkBooks
    @bookmark=Book.where(id: Bookmark.select('book_id').where(:student_id=>current_student.id))
    @checkout = Book.where(id: Checkout.select('book_id').where(:return_date =>nil, :student_id => current_student.id))
  end
  
  def checkout # check if the given book is a special book or not
    @book = Book.find(params[:id])

    if(@book.available_quantity>0)
      if Checkout.where(:student_id => current_student.id , :book_id => @book.id, :return_date => nil).first.nil?
        @checkout = Checkout.new(:student_id => current_student.id , :book_id => @book.id , :issue_date => Date.today , :return_date =>nil , :validity => Library.find(@book.library_id).borrow_limit)
        flash[:notice] = "Book Successfully checked Out"
        @book.decrement(:count)
        @checkout.save!
        @book.save!
      else 
        flash[:notice] = "Book Already Checked Out!!!"
      end  
    else
      if Checkout.where(:student_id => current_student.id , :book_id => @book.id).first.nil?
        if HoldRequest.where(:student_id => current_student.id , :book_id => @book.id).first.nil?
          @hold_request =  HoldRequest.new(:student_id => current_student.id , :book_id => @book.id)
          @hold_request.save!
          flash[:notice] = "Book Hold Request Placed"
        else 
          flash[:notice] = "Book Hold Request Is Already Placed"
        end
      else
        flash[:notice] = "Book Already Checked Out!!!"
      end
    end
	  redirect_to action: "index"
  end

  def returnBook
    @book = Book.find(params[:id])
    if(@book.available_quantity>0) 
      if !Checkout.where(:student_id => current_student.id , :book_id => @book.id).first.nil?
        @checkout = Checkout.where(:student_id => current_student.id , :book_id => @book.id ).first
        @checkout.update( :return_date => Date.today)
        @checkout.save!
        flash[:notice] = "Book Successfully returned"
        @user = current_student
        @book.increment(:count)
        @book.save!
      else 
        flash[:notice] = "Book is not checked out"
      end  
    else
      if !Checkout.where(:student_id => current_student.id , :book_id => @book.id).nil?
        @hold_request = HoldRequest.where(:book_id => @book.id).first
        if @hold_request.nil?
          @checkout = Checkout.where(:student_id => current_student.id , :book_id => @book.id )
          @checkout.update( :return_date => Date.today)
          @checkout.save!
          flash[:notice] = "Book Successfully returned"
          @book.increment(:count)
          @book.save!
        else
          @checkout = Checkout.where(:student_id => current_student.id , :book_id => @book.id )
          @checkout.update( :return_date => Date.today)
          @checkout.save!
          flash[:notice] = "Book Successfully returned"
          @hold_request.destroy
        end
      end
    end
	  redirect_to action: "getBookmarkBooks"
  end

  def getStudentBookFine
    if(!current_student.nil?)
      @checkouts = Checkout.where(:student_id => current_student.id , :return_date => nil )
    elsif (!current_admin.nil?)
      @checkouts = Checkout.where(:return_date => nil )
    end
    if !@checkouts.nil?
      @fines = Array.new
      @checkouts.each do |checkout|
        if checkout.issue_date + checkout.validity < Date.today
          delay = (Date.today - checkout.issue_date).to_i - checkout.validity
          fine_per_day  = Library.find(Book.find(checkout.book_id).library_id).overdue_fines
          @fines.push({:fine_ammount => delay * fine_per_day, :book_id => checkout.book_id})
        end
      end
    end
  end
  
  def getOverdueBooks
    @checkouts = Checkout.where(:return_date => nil, :book_id => Book.select('id').where(:library_id => Library.select('id').where(:name => current_librarian.library )))
    if !@checkouts.nil?
      @fines = Array.new
      @checkouts.each do |checkout|
        if checkout.issue_date + checkout.validity < Date.today
          delay = (Date.today - checkout.issue_date).to_i - checkout.validity
          fine_per_day  = Library.find(Book.find(checkout.book_id).library_id).overdue_fines
          @fines.push({:fine_ammount => delay * fine_per_day, :book_id => checkout.book_id , :student_id => checkout.student_id})
        end
      end
    end
  end
  
  def viewHoldRequestForLibrarian
    @holdreqs = HoldRequest.where(:book_id => Book.where(:library_id => Library.select('id').where(:name => current_librarian.library) ))
  end

  def viewHoldRequestForAdmin
    @holdreqs = HoldRequest.all
    render "viewHoldRequestForLibrarian"
  end
  
  def viewBookHistory
    @checkouts = Checkout.where.not(:return_date => nil ).where(:book_id => params[:id])
  end  
  
  def list_checkedoutBooks
    @books = Book.where(id: Checkout.select('book_id').where(:return_date =>nil))
  end
  def viewHoldRequestForLibrarian
    @holdreqs = HoldRequest.where(:book_id => Book.where(:library_id => Library.select('id').where(:name => current_librarian.library) ))
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :title, :author, :language, :published, :edition, :library_id, :subject, :summary, :special,:quantity,:available_quantity)
    end
end
