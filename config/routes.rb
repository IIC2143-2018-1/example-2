Rails.application.routes.draw do
  get 'albums/index'

  get 'albums/show'

  get 'albums/new'

  get 'albums/edit'

  get 'albums/update'

  get 'albums/create'

  resources :artists

  root 'artists#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
