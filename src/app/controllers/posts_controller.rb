class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    # Get /post
    def index
        @posts = Post.all
    end
    # Get /post/1
    def show
    end
    # Get /post/new
    def new
        @post = Post.new
    end
    # POST /posts
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post, notice: "Post created"
        else
            render :new
        end
    end

    # Get /post/1/edit

    def edit
    end

    # Path/put /posts/1
    def update
        if @post.update(post_params)
            redirect_to @post, notice: "Post updated"
        else
            render :edit
        end
    end

    # delete posts/1
    def destroy
        @post.destroy
        redirect_to posts_url, notice: "Post destroyed"
    end


    private
    def post_params
        params.require(:post).permit(:title, :content)
    end
    def set_post
        @post = Post.find(params[:id])
    end
        
end