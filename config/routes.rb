Rails.application.routes.draw do
  root "homes#index"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  
  resources :snacks

  get "my_snacks", to: "users#my_snacks"
end
