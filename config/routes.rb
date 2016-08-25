Rails.application.routes.draw do
  
  
  devise_for :users
  
  authenticated :user do
    root 'users#show', as: :authenticated_root
  end
  
  root 'home#index'
  
  resources :home, only: [:index]
  get 'about', to: 'home#about'
  get 'home', to: 'home#index'
  get 'news', to: 'home#news'
  
  scope '/users' do
    get 'profile', to: 'users#show'
    post 'register', to: 'users#register'
  end
  
  resources :characters, controller: :gaming_objects, type: "Character", only: [:index, :show] do
    resources :tips, only: [:show]
  end
  resources :maps, controller: :gaming_objects, type: "Map", only: [:index, :show] do
    resources :tips, only: [:show]
  end
  
  resources :tips, only: [:create, :update] do
    member do
      post :upvote
      post :downvote
    end
  end
  
  scope '/api' do
    scope '/v1' do
      get 'tips/random', to: 'api/tips#random'
      
      resources :maps, controller: "api/gaming_objects", type: "Map", only: [:index, :show] do
        resources :tips, controller: "api/tips", only: [:index]
      end
      resources :characters, controller: "api/gaming_objects", type: "Character", only: [:index, :show] do
        resources :tips, controller: "api/tips", only: [:index]
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
