Rails.application.routes.draw do
  resources :deputies
  resources :expenses
  resources :expense_types
  resources :providers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
