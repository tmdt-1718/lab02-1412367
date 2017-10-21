Rails.application.routes.draw do
  get     "login"    => "sessions#new"
  post    "login"    => "sessions#create"
  delete  "logout"   => "sessions#destroy"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "check_mail_address", to: "users#check_mail_address"
  resources :users
  get "/signup_success", to: "users#signup_success"
  get "/signup_fail", to: "users#signup_fail"
  get "users/:token/confirm_mail_address", :to => "users#confirm_mail_address", as: 'confirm_mail_address'
  resources :users do
    put :confirm_mail_address, on: :member
  end
end
