Rails.application.routes.draw do
  root 'news_papers#index'
  resources :news_papers do 
    resources :articles do 
      resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end