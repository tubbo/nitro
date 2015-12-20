Rails.application.routes.draw do
  resources :releases
  resources :projects
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
end
