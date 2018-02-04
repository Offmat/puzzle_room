class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params.merge(user: current_user))
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

  def find_lua(object)
    if object.is_a?(Comment)
      find_lua(object.commentable)
    else
      object
    end
  end
end
