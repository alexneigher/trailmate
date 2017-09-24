Rails.application.routes.draw do
  resources :trips
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  authenticated :user do
    root 'trips#index', as: :authenticated_root
  end

  root "welcome#index"

  #route to share urls
  namespace :public, path: ':url_slug' do
    get '/', to: 'trips#index', as: :trips
    get '/:id', to: 'trips#show', as: :trip
  end

end
