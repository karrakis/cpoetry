Rails.application.routes.draw do
  devise_for :users
  resources :poem_bills
  resources :poems
  resources :words
  resources :bill_words
  resources :bills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get '/' => 'home#index'
	get '/home' => 'home#index'
end
