# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "products#index"

  resources :products, only: %i[index show]
  resources :categories, only: [:show]
  resources :about, only: [:index]
  resources :users, only: %i[new create]
  resources :orders, only: %i[create index show]

  get "/users/login" => "sessions#new", as: :login
  post "/users/login" => "sessions#create", as: :login_submit
  get "/users/logout" => "sessions#destroy", as: :logout

  resource :users do
    collection do
      post "create_guest"
    end
  end

  # To be deprecated and replaced with a state handler on the front end
  resource :cart, only: [:show] do
    post :fill
    post :empty
    post :add_item
    post :remove_item
  end

  namespace :admin do
    root to: "dashboard#show"
    resources :products, except: %i[edit update show]
    resources :categories, except: %i[edit update show]
    resources :sales, only: %i[index new destroy]
    resources :users, only: %i[index destroy]
    resources :orders, only: %i[index show]

    resource :orders do
      member do
        post "change_status" # An update route that only allows for status to be changed
      end
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
