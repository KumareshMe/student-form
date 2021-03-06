Rails.application.routes.draw do
  root 'pages#home'
  resources :students
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :colleges, except: [:destroy]
  resources :courses, except: [:destroy]
end