class Comment < ApplicationRecord
  belongs_to :image
  belongs_to :user

  validates :text, presence: true

end
