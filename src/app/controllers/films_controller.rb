class FilmsController < ApplicationController
    before_action :set_film, only: [:show, :edit, :update, :destroy]
    # Get /post
    def index
        @films = Film.where(:user_id => current_user.id)
    end
    # Get /post/1
    def show
    end
    # Get /post/new
    def new
        @film = Film.new
    end
    # POST /posts
    def create
        @film = Film.new(film_params)
        if @film.save
            redirect_to @film, notice: "Movie created"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @film.update(film_params)
            redirect_to @film, notice: "Movie updated"
        else
            render :edit
        end
    end

    def destroy
        @film.destroy
        redirect_to films_url, notice: "Movie destroyed"
    end

    def all
        @films = Film.all
    end


    private
    def film_params
        params.require(:film).permit(:title, :description, :director, :genre_id).merge(user_id: current_user.id)
    end
    def set_film
        @film = Film.find(params[:id])
    end
        
end