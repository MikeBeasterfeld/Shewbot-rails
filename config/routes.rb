Shewbot::Application.routes.draw do
  get "rake/routes"

  root to: 'static_pages#home'

  match '/auth/twitter/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
  match '/sessions/visitor_count', to: 'sessions#visitor_count'
  match '/titles/create', to: 'titles#create'
  match '/titles', to: 'titles#index'
  match '/title/:id/upvote', to: 'titles#upvote'
  match '/shows/current', to: 'shows#current', via: :get, :defaults => { :format => 'json' }

  resources :irc_users, only: :show

  resources :shows, only: [:index, :show]

  namespace :admin do
    resources :apis
    resources :users
    resources :votes
    resources :titles
    resources :shows
    resources :irc_users
    resources :visitors, only: [:index]
  end

end
