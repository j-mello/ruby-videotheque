class TrocsController < ApplicationController
    before_action :authenticate_user!, only: [:index]

    # Get /trocs
    def index
        @users = User.all
        @films = Film.all
        @currentUserId = current_user.id
    end

    # POST /trocs
    def create
        @troc = Log.new(troc_params)
        if @film.troc
            redirect_to @troc, notice: "Troc created"
        else
            render :new
        end
    end

    private
    def troc_params
        params.require(:log).permit(:dateEmprunt, :dateRetour, :etat, :film_id, :user_id2).merge(user_id1: current_user.id)
    end
end