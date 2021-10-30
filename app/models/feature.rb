class Feature < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '飲みやすい' },
    { id: 3, name: 'ちょっと苦め' },
    { id: 4, name: 'フルーティ' },
    { id: 5, name: 'ホワイトビール' },
    { id: 6, name: '黒ビール' },
    { id: 7, name: 'おもしろい味' },
    { id: 8, name: 'はじめての味' },
    { id: 9, name: 'その他' },
  ]
 
   include ActiveHash::Associations
   has_many :images
 
  end