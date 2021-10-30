class Image < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :image_tag_relations
  has_many :tags, through: :image_tag_relations
  has_many :likes, dependent: :destroy
  


  belongs_to_active_hash :prefecture
  belongs_to_active_hash :feature


with_options presence: true do
  validates :title
  validates :content
  validates :image
  validates :prefecture_id, numericality:  { other_than: 1 , message: "can't be blank"}
  validates :feature_id, numericality:  { other_than: 1 , message: "can't be blank"}
end
  def self.search(search)
    if search != ""
      Image.where('title LIKE(?)', "%#{search}%")
    else
      Image.all
    end
  end


  
end
