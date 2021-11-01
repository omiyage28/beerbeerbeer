FactoryBot.define do
  factory :image do
    
    title                {'ビール'}
    content              {'説明'}
    prefecture_id        {2}
    feature_id           {2}
    association :user
  

    after(:build) do |image|
      image.image.attach(io: File.open('spec/fixtures/IMG_1533.jpeg'), filename: 'IMG_1533.jpeg')
    end
  end
end
