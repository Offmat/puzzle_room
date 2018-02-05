class CommentsController < ApplicationController
  def create
    authorize @comment = Comment.new(permitted_attributes(Comment).merge(user: current_user))
    if @comment.save
      redirect_to find_lua(@comment), notice: "Commented"
    else
      redirect_to find_lua(@comment), alert: "Not commented"
    end
  end

  def destroy
    authorize @comment = Comment.find(params[:id])
    if @comment.comments.any?
      @comment.update(body: '--comment deleted--')
    else
      @comment.destroy
    end
    redirect_to find_lua(@comment), alert: "Comment deleted"
  end

  private

  def find_lua(object)
    if object.is_a?(Comment)
      find_lua(object.commentable)
    else
      object
    end
  end
end
