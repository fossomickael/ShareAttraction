Rails.application.routes.draw do
  get 'attraction_members/new'
  get 'attraction_members/create'
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :attractions, only: [:create, :new, :show, :index] do
    resources :attraction_members, only: [:create, :new]
  end
  
  resources :posts, only: [:create, :new, :show]
  resources :mentions, only: [:index]
  

  authenticated :user do 
    root to: 'dashboards#dashboard', as: :root_authenticate
  end
  root to: 'pages#home'
end
