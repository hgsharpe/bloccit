Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
   resources :posts, except: [:index]
   resources :sponsored_posts, except: [:index]
  end
  
  resources :posts, only: [] do
   resources :comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :advertisements, :questions
  post 'users/confirm' => 'users#confirm'

  
  get 'about' => 'welcome#about'
  
  root 'welcome#index'
  

end