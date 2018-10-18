Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :contacts
    end
  end
  get 'home/show'
  devise_for :users
  root to: 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
