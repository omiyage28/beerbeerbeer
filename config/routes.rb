Rails.application.routes.draw do
  
devise_for :users
root to: "images#index"


get '/image/prefecture', to: "images#prefecture"
get '/image/feature', to: "images#feature"

get 'rakuten_search' => 'rakuten#search'

  get '/images/map', to: "images#map"
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  resources :images do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show, :destroy]
  
end
