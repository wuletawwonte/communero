Rails.application.routes.draw do  
  resources :groups do
    resources :posts
  end
  resources :posts, only: [] do    
    resources :comments
  end 
  
  resources :comments, only: [] do      
    resources :sub_comments
  end  

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
