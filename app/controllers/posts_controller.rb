class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :is_author?, only: [:edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    #debugger

    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    post = Post.find_by(post_params)
    post.destroy
    redirect_to post_url(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end

  def is_author?()
    current_user.posts.find(params[:id]) ? true : false
  end
end
