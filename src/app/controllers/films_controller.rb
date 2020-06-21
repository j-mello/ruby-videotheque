class FilmsController < ApplicationController
    before_action :set_film, only: [:show, :edit, :update, :destroy]
    # Get /post
    def index
        authorize! :read, Film
        @films = Film.all
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

    # Get /post/1/edit

    def edit
    end

    # Path/put /posts/1
    def update
        if @film.update(film_params)
            redirect_to @film, notice: "Movie updated"
        else
            render :edit
        end
    end

    # delete posts/1
    def destroy
        @film.destroy
        redirect_to films_url, notice: "Movie destroyed"
    end


    private
    def film_params
        params.require(:film).permit(:title, :description, :director, :duration, :genre_id)
    end
    def set_film
        @film = Film.find(params[:id])
    end
        
end