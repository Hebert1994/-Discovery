Rails.application.routes.draw do
  get 'home/index'
  get 'bootstrap/index'
  resources :comments
  devise_for :users
  devise_for :admins
  resources :courses do
      member do
      put "like", to: "courses#upvote"
      put "dislike", to: "courses#downvote"
    end
    resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to:'home#index'
end
