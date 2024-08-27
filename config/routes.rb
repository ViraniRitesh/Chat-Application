Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create] do
  	resources :conversations, only: [:index, :create] do
  	  resources :messages, only: [:index, :create]
  	end
  end
end
