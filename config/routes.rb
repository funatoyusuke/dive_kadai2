Rails.application.routes.draw do
  root to: "sessions#new"

  get     'login',   to: 'sessions#new'
  post    'login',   to: 'sessions#create'
  delete  'logout',  to: 'sessions#destroy'


  resources :blogs do
    collection do
      get 'top'
      post 'confirm'
    end
  end
  resources :users
  get '/users/favo/:id', to:'users#favo'
  resources :sessions, only: [:new, :create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
  
  mount LetterOpenerWeb::Engine, at: "/letter" if Rails.env.development?
end

