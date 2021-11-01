class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def show
      @images = @user.images
  end

  def destroy
      @user.destroy
      flash[:notice] = 'deleted as requested '
      redirect_to :root 
  end

  private
  def set_user
     @user = User.find_by(:id => params[:id])
  end





end

