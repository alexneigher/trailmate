Rails.application.routes.draw do
  resources :trips
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: 'welcome#index'
end
