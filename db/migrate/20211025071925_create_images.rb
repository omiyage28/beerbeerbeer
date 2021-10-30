class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :title
      t.text :content 
      t.references :user
      t.integer :prefecture_id, null: false
      t.integer :feature_id, null: false
      t.timestamps
    end
  end
end
