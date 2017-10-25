Rails.application.routes.draw do

  root :to => "sessions#new"

  get     "login", to: "sessions#new"
  post    "login", to: "sessions#create"
  delete  "logout"   => "sessions#destroy"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "check_email_address", to: "users#check_email_address"
  resources :users
  get "/signup_success", to: "users#signup_success"
  get "/signup_fail", to: "users#signup_fail"
  get "users/:token/confirm_email_address", :to => "users#confirm_email_address", as: 'confirm_email_address'
  resources :users do
    put :confirm_email_address, on: :member
  end
  resources :messages
  get "/inbox", to: "dashboard#inbox"
  get "/compose" , to: "messages#new"
  get "/outbox", to: "dashboard#outbox"
  get "/friends" , to: "dashboard#friends"
end
