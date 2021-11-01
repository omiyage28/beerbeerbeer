require 'rails_helper'

RSpec.describe Image, type: :model do
  before do
    @image = FactoryBot.build(:image)
  end

  describe '画像の情報入力' do
    context '画像投稿入力がうまくいく時' do
      it '全ての項目が入力されていれば投稿できる' do
        expect(@image).to be_valid
      end
    end
    context '商品情報の入力がうまくいかない時' do
      it '画像が空だと出品できない' do
        @image.image = nil
        @image.valid?
        expect(@image.errors.full_messages).to include ("Image can't be blank")
      end
  
      it 'タイトルが空だと出品できない' do
        @image.title = ''
        @image.valid?
        expect(@image.errors.full_messages).to include("Title can't be blank")
      end

      it '説明文が空だと出品できない' do
        @image.content = ''
        @image.valid?
        expect(@image.errors.full_messages).to include("Content can't be blank")
      end
  
      it '都道府県が未選択だと出品できない' do
        @image.prefecture_id = nil
        @image.valid?
        expect(@image.errors.full_messages).to include("Prefecture can't be blank")
      end
  
      it '特徴が未選択だと出品できない' do
        @image.feature_id = nil
        @image.valid?
        expect(@image.errors.full_messages).to include("Feature can't be blank")
      end
  
      it 'userが紐付いていなければ投稿できない' do
        @image.user = nil
        @image.valid?
        expect(@image.errors.full_messages).to include("User must exist")
       end
    end
  end
end
