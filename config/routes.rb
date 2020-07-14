Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/backoffice', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'

  post '/quote' => 'pages#submit_quote'

  post '/contact' => 'pages#contact'

  get '/residential' => 'pages#residential'

  get '/corporate' => 'pages#corporate'

  get '/quote' => 'pages#quote'

  get "pages/index"
  
end
