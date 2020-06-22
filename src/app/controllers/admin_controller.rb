class AdminController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:destroy]

    def index
        @users = User.all
    end

    def show
    end

    # delete users/1
    def destroy
        @user.destroy
        redirect_to admin_url, notice: "Utilisateur supprimé"
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
end