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
end
