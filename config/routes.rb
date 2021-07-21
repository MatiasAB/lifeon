Rails.application.routes.draw do
  devise_for :users, controllers: {
           :sessions => "users/sessions",
           :registrations => "users/registrations" }
  resources :users, only: [:show]
  devise_scope :user do
	  # get "/:id" => "users#show", :as => "user_root", :id => :username
  end
  
  
  resources :tasks
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "/", to: "home#index"
  
end
