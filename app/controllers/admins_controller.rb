class AdminsController < ApplicationController
    before_action :set_admin,only:[:show,:edit,:update,:destroy]
    before_action :authenticate_admin!

    def index
    end

    def show
    end

    def new
        @admin =Admin.new
    end

    def edit
        
    end
    
    def create
        @admin=Admin.new(admin_params)
        @admin.save
        redirect_to admin_path(@admin)
    end
    
    def update
        @admin.update(admin_params)
        redirect_to admin_path(@admin)
    end

    def destroy
        @admin.destroy
        redirect_to admins_url
    end
    private
    
        def set_admin
            @admin=Admin.find(params[:id])
        end

        def admin_params
            params.require(:admin).permit(:name,:email,:password)
        end
end
