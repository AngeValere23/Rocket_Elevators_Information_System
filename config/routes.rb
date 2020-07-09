Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backoffice', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'pages#index'

  get '/residential' => 'pages#residential'

  get '/corporate' => 'pages#corporate'

  get '/quote' => 'pages#quote'

  get "pages/index"
end
