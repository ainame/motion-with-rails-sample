class PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      p @post
      render json: @post, status: :created, location: @record
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

end
