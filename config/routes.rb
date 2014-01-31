Rails.application.routes.draw do
  devise_scope :user do
    get '/', to: 'devise/sessions#new'
    match "logout", :to => "devise/sessions#destroy", via: [:delete, :get, :post]
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :things => '/things_do' }

  get 'dashboard' => 'dashboards#index', as: :dashboard
  resources :dashboards, only: [:show]
  resources :assets

  root :to => 'devise/sessions#new'
end
