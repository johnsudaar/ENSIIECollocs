Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { sessions: "users/sessions" }
  post 'json/login'
  get 'json/search'
  get 'json/user_search'

  post "collocs/addpic/:id", to:'collocs#addpic', as: :colloc_pic_add
  get "collocs/delpic/:id/:pic", to:"collocs#delpic", as: :colloc_pic_del
  get "collocs/accept/:id/:user", to:"collocs#accept", as: :colloc_accept
  get "collocs/leave/:id/:user", to:"collocs#leave", as: :colloc_leave
  post "collocs/addEmail/:id", to:"collocs#add_email", as: :colloc_add_email
  get "collocs/search"
  get "collocs/join/:id", to:"collocs#join", as: :colloc_join

  get 'administration/users'
  get 'administration/setadmin/:id', to: 'administration#setadmin', as: :administration_set_admin
  get 'administration/activation/:id', to: 'administration#setactivation', as: :administration_activation

  resources :collocs
end
