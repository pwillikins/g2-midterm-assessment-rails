Rails.application.routes.draw do
  root "walls#index"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout

  resources :posts do
    resources :comments
  end

end
