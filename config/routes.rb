Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/about', to: 'pages#about'
  resources :groups, only: %i[index create show destroy] do
    resources :user_groups, only: %i[new create]
    resources :events, only: %i[create update]
  end
  resources :user_groups, only: :destroy
  resources :events, only: :destroy
  resources :days, only: [] do
    resources :day_vote, only: %i[create destroy]
  end
end
