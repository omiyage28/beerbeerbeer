class ImagesTag

  include ActiveModel::Model
  attr_accessor :title, :content, :image, :name

  with_options presence: true do
    validates :title
    validates :name
    validates :content
    validates :image
  end

  def save
    image = Imabe.create(title: title, content: content, image: image)
    tag = Tag.create(name: name)

    ImageTagRelation.create(image_id: image.id, tag_id: tag.id)
  end

end