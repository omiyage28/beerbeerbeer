class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to image_path(@comment.image)
    else
      render "images/show"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to image_path(@comment.image)
   
  end


  private
  def comment_params
      params.require(:comment).permit(:text).merge(user_id: current_user.id, image_id: params[:image_id])
  end












end
