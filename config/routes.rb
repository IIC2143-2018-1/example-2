Rails.application.routes.draw do
  devise_for :users
  resources :artists do
    resources :albums do
      resources :songs
    end
  end
  resources 'home', only: :index
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
