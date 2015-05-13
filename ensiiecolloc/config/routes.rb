Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { sessions: "users/sessions" }
  post 'json/login'
  get 'json/search'

  post "collocs/addpic/:id", to:'collocs#addpic', as: :colloc_pic_add
  get "collocs/delpic/:id/:pic", to:"collocs#delpic", as: :colloc_pic_del
  get "collocs/search"

  get 'administration/users'
  get 'administration/setadmin/:id', to: 'administration#setadmin', as: :administration_set_admin
  get 'administration/activation/:id', to: 'administration#setactivation', as: :administration_activation

  resources :collocs
end
