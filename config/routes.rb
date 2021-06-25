Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :attractions, only: [:create, :new, :show, :index]
  
  resources :posts, only: [:create, :new, :show]

  authenticated :user do 
    root to: 'dashboards#dashboard', as: :root_authenticate
  end
  root to: 'pages#home'
end
