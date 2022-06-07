Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/create'
  devise_for :users
  root to: "pages#home"
end
