Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :groups, only: %i[index create show destroy] do
    resources :user_groups, only: %i[create destroy]
    resources :events, only: :create
  end
end
