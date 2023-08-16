Rails.application.routes.draw do
  root "landing#homepage"
  
  get 'admin', to: "landing#admin"
  resources :users, :controller => 'users'
  get '/destroy/:id', to: 'users#destroy', as: 'destroy_user'

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_out', to: 'devise/sessions#destroy'
    post 'sign_in', to: 'devise/sessions#create'
  end
end
