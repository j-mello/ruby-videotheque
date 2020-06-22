class UserController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:destroy]

    def index
        if(current_user.role != 'admin')
            redirect_to root_path
        else
            @users = User.all
        end
    end

    def show
    end

    # delete users/1
    def destroy
        @user.destroy
        redirect_to "/user", notice: "Utilisateur supprimé"
    end

    private
    def set_user
        @user = User.find(params[:id])
    end
end