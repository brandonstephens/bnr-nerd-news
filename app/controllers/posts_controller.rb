class PostsController < ApplicationController
  def index
    @posts = Post.all.latest
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(user_id: current_user.id)
  end

  def create
    @post = Post.new(post_params)

    if @post.save()
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    flash[:success] = 'Post updated' if @post.update_attributes(post_params)
    redirect_to post_path(@post)

  rescue ActiveRecord::StaleObjectError
    @post.reload
    render 'conflict'
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:url, :headline, :user_id, :lock_version)
  end

end
