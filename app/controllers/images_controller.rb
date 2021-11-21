class ImagesController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search, :prefecture, :hashtag, :map]
  before_action :search_image, only: [:index, :prefecture, :feature]
  


  def index
    @image = Image.includes(:user).order("created_at DESC")
    @all_ranks = Image.find(Like.group(:image_id).order('count(image_id) desc').limit(3).pluck(:image_id))
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
      if @image.save
      redirect_to root_path(@image)
      else
      render :new
      end
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments.includes(:user)
    @user = User.new
  end

  def edit
    @image = Image.find(params[:id])
    redirect_to root_path unless current_user.id == @image.user_id
  end

  def update
    @image = Image.find(params[:id])
     if @image.update(image_params)
      redirect_to image_path(@image)
     else
      render :edit
     end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to root_path
  end

  def search
    @images = Image.search(params[:keyword])
  end


def map
end


def rakuten
end


def prefecture
  @images = @q.result
  prefecture_id = params[:q][:prefecture_id_eq]
  @prefecture = Prefecture.find_by(id: prefecture_id)
end


def feature
  @images = @q.result
  feature_id = params[:q][:feature_id_eq]
  @feature = Feature.find_by(id: feature_id)
end




  private
  def image_params
    params.require(:image).permit(:title, :content, :image, :prefecture_id, :feature_id).merge(user_id: current_user.id)
    
  end
 
  def move_to_index
    unless user_signed_in?
  redirect_to action: :index
    end
  end

  def search_image
    @q = Image.ransack(params[:q])
  end


  
end
