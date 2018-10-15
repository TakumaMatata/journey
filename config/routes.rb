Rails.application.routes.draw do
root :to => 'users#index'
resources :user_sessions
resources :users do
  resources :favorites
end

get 'login' => 'user_sessions#new', :as => :login
post 'logout' => 'user_sessions#destroy', :as => :logout
get 'hotels' => 'hotels#search', :as => :hotels
get 'hotels/:id' => 'hotels#show', :as => :hotel
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
