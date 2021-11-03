class LikesController < ApplicationController
  before_action :image_params
  before_action :authenticate_user!

  def create
    Like.create(user_id: current_user.id, image_id: params[:id])
    redirect_to images_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, image_id: params[:id]).destroy
    redirect_to images_path
  end

  private
 
  def image_params
    @image = Image.find(params[:id])
  end

end
