class AdminsController < ApplicationController

    def index
        @users = User.all.order("created_at DESC")
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to admins_path
    end

    def set
        @user = User.find(params[:id])
        @user.is_admin = true
        @user.save
        redirect_to admins_path
    end

    def remove
        @user = User.find(params[:id])
        @user.is_admin = false
        @user.save

        redirect_to admins_path
    end

    def blocked
        @user = User.find(params[:id])
        @user.is_blocked = !@user.is_blocked
        @user.save
        redirect_to admins_path
    end
end
