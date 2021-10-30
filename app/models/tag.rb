class Tag < ApplicationRecord
  has_many :image_tag_relations
  has_many :images, through: :image_tag_relations


  validates :name, presence: true
end
