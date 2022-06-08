Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :groups, only: %i[index create show] do
    resources :events, only: :create
  end
end
