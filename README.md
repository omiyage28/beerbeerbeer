
# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ |----------------------    |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false              |
| name               | string | null: false              |

- has_many :likes
- has_many :images

## images テーブル

| Column          | Type         | Options                       |
| -------------   | ------------ | ----------------------------  |
| title           | string       | null: false                   |
| name            | string       | null: false                   |
| content         | text         | null: false                   |
| user            | references   | null: false, foreign_key: true|
| prefecture_id   | integer      | null: false                   |
| feature_id      | integer      | null: false, foreign_key: true|



- has_many :image_tag_relations
- has_many :likes
- belongs_to :user

## image_users テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| image       | references | null: false, foreign_key: true |



## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | text       | null: false                    |
| image        | references | null: false, foreign_key: true|
| user         | references | null: false, foreign_key: true |

- belongs_to :image
- belongs_to :user



## image_likes テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image      | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

- belongs_to :image
- belongs_to :user