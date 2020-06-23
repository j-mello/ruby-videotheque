class TrocsController < ApplicationController
    before_action :authenticate_user!, only: [:index]

    # Get /trocs
    def index
        @myTrocs = Log.where(user_id1: current_user.id, etat: :waiting)
        @otherTrocs = Log.where(user_id2: current_user.id, etat: :waiting)
        @acceptedsTrocs = Log.where(user_id1: current_user.id, etat: :accepted)
        @refusedTrocs = Log.where(user_id1: current_user.id, etat: :refused)
    end

    # Get /trocs/1
    def show
    end

    # Get /trocs/new
    def new
        @users = User.all
        @films = Film.all
        @currentUserId = current_user.id
    end

    # POST /trocs
    def create
        @troc = Log.new(troc_params)
        #@troc = Log.new(film_id: params[:film_id].to_i, user_id1: current_user.id, user_id2: params[:user_id2].to_i, etat: :waiting)
        if @troc.save
            redirect_to "/trocs", notice: "Troc created"
        else
            render :new
        end
    end

    # Get /trocs/1/edit

    def edit
    end

    # Path/put /trocs/1
    def update
        log = Log.find(params[:id].to_i)
        if params[:etat] != "accept" and params[:etat] != "refus"
            redirect_to "/trocs", notice: "Mauvaise valeure pour l'argument 'etat' => "+params[:etat]
        elsif log.update(etat: params[:etat]+"ed")
            if (params[:etat] == "accept")
                film = Film.find(log.film.id)
                if (film.update(user_id: log.user1.id))
                    redirect_to "/trocs"
                else
                    log.update(etat: :waiting)
                    redirect_to "/trocs", notice: "Application de l'emprunt échoué.."
                end
            else
                redirect_to "/trocs"
            end
        else
            redirect_to "/trocs", notice: "Acceptation ou refus de l'emprunt echoué"
        end
    end

    private
    def troc_params
        params.permit(:film_id, :user_id2).merge(user_id1: current_user.id, etat: :waiting)
    end
end