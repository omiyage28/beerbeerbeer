## アプリ名
Local Beer

## 概要
地ビール画像を共有できるアプリです。

## 本番環境
URL https://beerbeerbeer-36993.herokuapp.com/  

## ログイン用アカウント
MAIL  ”a@a"  
PW    "aaa111"

## 制作背景(意図)
ビール好きな人に使用してもらいたいアプリです。  
コロナ禍以降、一緒にお酒の時間を共有することが少なくなり、人によっては虚しさを感じていると思います。なので、画像投稿することやコメントすることを通してビール好きな人との交流を匿名でできるアプリを作成しました。それに加えて、地ビールへ個人的な興味もあったので地ビール専用アプリにさせていただきました。

## Demo
### ログイン機能
[![Image from Gyazo](https://i.gyazo.com/7e79163bab984817b1c3689af996b727.gif)](https://gyazo.com/7e79163bab984817b1c3689af996b727)

### 新規投稿機能
[![Image from Gyazo](https://i.gyazo.com/8521395512a9cf7803207b080d6893d4.gif)](https://gyazo.com/8521395512a9cf7803207b080d6893d4)


## 工夫したポイント
  画像投稿だけではなく、いいね機能やランキング機能も実装しました。また、気になるビールがあればすぐに購入できるようにAPIを使用して楽天市場の検索機能も実装しました。
  
## 使用技術(開発環境)
### バックエンド
Ruby, Ruby on Rails
### データベース
MySQL、SequelPro
### ソース管理
GitHub, GitHubDesktop
### テスト
RSpec
### エディタ
VSCode

### 課題や今後実装したい機能
Ajaxを使用して非同期いいね機能の実装と
JavaScriptを利用してビールに関するQuizを実装したいです。



# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ |----------------------    |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false              |
| name               | string | null: false              |

### Association
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


### Association
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

### Association
- belongs_to :image
- belongs_to :user



## likes テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :image
- belongs_to :user