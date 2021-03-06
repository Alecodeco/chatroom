Rails.application.routes.draw do

  root 'chatroom#index'
  get 'about', to: 'chatroom#about'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  get 'change_status', to: 'users#change_status'
  get 'toggle_dark_mode', to: 'users#toggle_dark_mode'
  resources :users, except: [:new]

  post 'message', to: 'messages#create'
  get 'history', to: 'messages#index'
  get 'cleanup', to: 'messages#cleanup'

  mount ActionCable.server, at:"/cable"

end
