class CommentsController < ApplicationController
  def create
    @comment = Comment.new(user: current_user)
    @comment.attributes = comment_params
    if @comment.save
      redirect_to find_lua(@comment), notice: "Commented"
    else
      redirect_to find_lua(@comment), alert: "Not commented"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end
end
