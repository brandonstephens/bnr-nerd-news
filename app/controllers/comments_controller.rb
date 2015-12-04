class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def create
    @comment = current_user.comments.new(comment_params)

    flash[:success] = 'Comment created' if @comment.save
    @comment.save
    respond_with @comment, location: @comment.commentable
  end

  def close_thread
    @comment = Comment.find(params[:comment_id])

    Comment.transaction do
      @comment.close_thread
    end
    redirect_to @comment
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :body)
  end
end
