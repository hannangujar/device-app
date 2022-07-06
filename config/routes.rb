Rails.application.routes.draw do
  devise_for :users
  
  resources :products do
    resources :reviews
  end


  root 'pages#home'
  get 'pages/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
