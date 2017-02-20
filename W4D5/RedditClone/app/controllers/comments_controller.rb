class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = @comment.post.id#params[:post_id]
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end


  def comment_params
    params.require(:comment).permit(:content)
  end
end
