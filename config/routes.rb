Shewbot::Application.routes.draw do
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"

  resources :votes
  resources :titles
  resources :shows
  resources :irc_users
  resources :currenttitles

  root to: 'static_pages#home'

end
