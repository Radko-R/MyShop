require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root :to => 'products#index'

  mount ShopifyApp::Engine, at: '/'
  mount Sidekiq::Web => '/sidekiq'

  resources :products
  resources :carts, only: [:index]

  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"

  namespace :app_proxy do
    root action: 'index'
    # simple routes without a specified controller will go to AppProxyController

    # more complex routes will go to controllers in the AppProxy namespace
    # 	resources :reviews
    # GET /app_proxy/reviews will now be routed to
    # AppProxy::ReviewsController#index, for example
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
