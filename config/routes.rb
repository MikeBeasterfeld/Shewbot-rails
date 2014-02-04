Shewbot::Application.routes.draw do
  get "rake/routes"

  root to: 'static_pages#home'

  match '/auth/twitter/callback', to: 'sessions#create'
  match '/auth/failure', to: 'sessions#failure'
  match '/titles/create', to: 'titles#create'
  match '/titles', to: 'titles#index'
  match '/title/:id/upvote', to: 'titles#upvote'
  match '/shows/current', to: 'shows#current', via: :get

  resources :shows, only: [:index, :show]

  namespace :admin do
    resources :apis
    resources :users
    resources :votes
    resources :titles
    resources :shows
    resources :irc_users
  end

end
