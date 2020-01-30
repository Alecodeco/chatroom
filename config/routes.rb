Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'chatroom#index'

  get 'login', to: 'sessions#new'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  resources :users, except: [:new]

end
