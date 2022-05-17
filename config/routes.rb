Rails.application.routes.draw do
  get 'users/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  concern :posts_comments do 
    resources :comments
   end
  root "articles#index"
resources :articles, concerns: :posts_comments
end