class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :images
  has_many :comments
  has_many :likes

  validates :name, presence: true
  
  def liked_by?(image_id)
    likes.where(image_id: image_id).exists?
  end


end
