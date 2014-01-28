Rails.application.routes.draw do
  devise_scope :user do
    match "logout", :to => "devise/sessions#destroy", via: [:delete, :get, :post]
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  get 'dashboard' => 'dashboards#index', as: :dashboard
  resources :dashboards, except: [:index]

  root :to => 'dashboards#new'
end
