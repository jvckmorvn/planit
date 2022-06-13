Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :groups, only: %i[index create show destroy] do
    resources :user_groups, only: %i[new create]
    resources :events, only: :create
  end

  resources :user_groups, only: :destroy
  resources :events, only: :destroy
  get '/about', to: 'pages#about'
  resources :days, only: [] do
    resources :day_vote, only: %i[create destroy]
  end
end
