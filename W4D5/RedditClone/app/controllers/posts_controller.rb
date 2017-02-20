class PostsController < ApplicationController

  before_action :logged_in?

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)

    @post.user_id = current_user.id
    if @post.save!
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      fail
      render :new
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def edit
    @post = Post.find_by(id: params[:id])
    if @post.user_id == current_user.id
      render :edit
    else
      flash[:errors] = ['You are not the author']
      redirect_to post_url(@post)
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = ['Unable to update']
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    redirect_to sub_url(@post.sub_id)
    @post.destroy
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end
