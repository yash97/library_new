class LibrariansController < ApplicationController
    before_action :set_librarian,only: [:show,:edit,:update,:destroy]
    
    def index
        if admin_signed_in?
            sign_out :librarian
            redirect_to admins_path
        else
            library_name=current_librarian.library
            puts library_name
            @library = Library.all.where(:name => library_name).first
            @librarians=librarian.all
        end
    end

    def home_page
    end

    def show
    end

    def new
        @librarian=Librarian.new
    end

end
