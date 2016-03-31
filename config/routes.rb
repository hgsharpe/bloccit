Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end
  
  resources :advertisements, :questions

  get 'about' => 'welcome#about'
  get 'faq'=> 'welcome#faq'
  root 'welcome#index'
end
