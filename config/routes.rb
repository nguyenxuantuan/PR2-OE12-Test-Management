Rails.application.routes.draw do

  root "home#index"
  devise_for :users

  resources :user do
    get "signin", to: "devise/sessions#new"
    post "signin", to: "devise/sessions#create"
    delete "signout", to: "devise/sessions#destroy"
  end

  resources :sessionexams do
    get "sessionexams/index"
    get "sessionexams/show"
    get "sessionexams/new"
    get "sessionexams/edit"
  end
end
