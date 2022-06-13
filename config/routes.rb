Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/about', to: 'pages#about'
  resources :groups, only: %i[index create show destroy] do
    resources :user_groups, only: %i[new create destroy]
    resources :events, only: %i[create destroy]
  end
end
