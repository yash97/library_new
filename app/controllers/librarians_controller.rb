class LibrariansController < ApplicationController
    before_action :set_librarian,only: [:show,:edit,:update,:destroy]
    
    def index
        if admin_signed_in?
            @librarians=Librarian.all
        end
    end

    def home_page
    end

    def show
    end

    def new
        @librarian=Librarian.new
    end

    def list_librarians
        @librarians=Librarian.all
    end

    def destroy
        if admin_signed_in?
            @librarian.destroy
            redirect_to list_librarians_path
        else
            flash[:notice]='you cannot destroy librarian'
        end
    end


    private

        def set_librarian
            @librarian=Librarian.find(params[:id])
        end

        def librarian_parmas
            params.require(:librarian).permit(:name,:email,:password,:library_id)
        end
end
