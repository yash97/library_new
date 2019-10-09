class BookmarksController < ApplicationController
    before_action :find_book, :find_student
    before_action :find_bookmark,only: [:destroy]

    def create
        if already_bookmarked?
            flash[:notice]="It is already bookmarked"
        else
            @book.bookmarks.create(student_id: @current_student.id)
            flash[:notice]="bookmark sucessfull"
        end
    end

    def destroy
        if !already_bookmarked?
            flash[:notice]="you already unbookmarked it"
        else
            flash[:notice]="bookmark removed"
            @bookmark.destroy
        end
    end

    private
    
    def find_book
        @book=Book.find(params[:book_id])
    end

    def find_bookmark
        @bookmark=@book.bookmarks.find(params[:id])
    end

    def find_student
        @student=current_student
    end

    def already_bookmarked?
        Bookmark.where(student_id:@student.id,book_id: params[:book_id]).exists?
    end
    

end
