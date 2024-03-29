Rails.application.routes.draw do
  get 'attraction_members/new'
  get 'attraction_members/create'
  get 'posts/new'
  get 'posts/create'
  get 'posts/show'
  get '/dashboard/posts/:id/stats', to: 'dashboards#post_stats'
  get '/dashboard/mentionedposts', to: 'dashboards#dashboard'
  get '/dashboard', to: 'dashboards#dashboard'
  
    devise_for :users, controllers: {invitations: "users/invitations"}
  
  resources :short_links, only: [:create, :new, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :attractions, only: [:create, :new, :show, :index] do
    resources :attraction_members, only: [:create, :new]
    get '/invite', to: 'attractions#invite'
    resources :users do
      collection do
        post 'batch_invite'
      end
    end
  end
  
  resources :posts, only: [:create, :new, :show, :edit, :update]


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :mentions, only: [:index]
      get '/attractions/user/:username', to: 'attractions#one_user'
      get '/attractions/user/mentioned/:username', to: 'attractions#mentioned'
      get '/posts/:id/referrers', to: 'posts#referrers'
    end
  end

 
  root to: 'pages#home'
  resources :users, only: [:show]
  get ':short', to: 'short_links#redirection', constraints: { domain: ENV["SHORT_DOMAIN"] }

  get '/:id', to: 'posts#show'

  
end
