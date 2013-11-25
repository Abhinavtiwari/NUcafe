NUcafe::Application.routes.draw do
  
  devise_for :admins
  devise_for :users  
  root "about#about"

  get '/about', controller:'about', action:'about'

  # Routes for the Item_menu resource:
  # CREATE
  get '/item_menus/new', controller: 'item_menus', action: 'new', as: 'new_item_menu'
  post '/item_menus', controller: 'item_menus', action: 'create', as: 'item_menus'

  # READ
  get '/item_menus', controller: 'item_menus', action: 'index'
  get '/item_menus/:id', controller: 'item_menus', action: 'show', as: 'item_menu'

  # UPDATE
  get '/item_menus/:id/edit', controller: 'item_menus', action: 'edit', as: 'edit_item_menu'
  patch '/item_menus/:id', controller: 'item_menus', action: 'update'

  # DELETE
  delete '/item_menus/:id', controller: 'item_menus', action: 'destroy'
  #------------------------------

  # Routes for the Order_menu resource:
  # CREATE
  post '/order_menus/new', controller: 'order_menus', action: 'new', as: 'new_order_menu'
  post '/order_menus', controller: 'order_menus', action: 'create', as: 'order_menus'

  # READ
  get '/order_menus', controller: 'order_menus', action: 'index'
  get '/order_menus/:id', controller: 'order_menus', action: 'show', as: 'order_menu'

  # UPDATE
  get '/order_menus/:id/edit', controller: 'order_menus', action: 'edit', as: 'edit_order_menu'
  patch '/order_menus/:id', controller: 'order_menus', action: 'update'

  # DELETE
  delete '/order_menus/:id', controller: 'order_menus', action: 'destroy'
  #------------------------------

  # Routes for the Order_summary resource:
  # CREATE
  get '/order_summaries/new', controller: 'order_summaries', action: 'new', as: 'new_order_summary'
  post '/order_summaries', controller: 'order_summaries', action: 'create', as: 'order_summaries'

  # READ
  get '/order_summaries', controller: 'order_summaries', action: 'index'
  get '/order_summaries/:id', controller: 'order_summaries', action: 'show', as: 'order_summary'

  # UPDATE
  get '/order_summaries/:id/edit', controller: 'order_summaries', action: 'edit', as: 'edit_order_summary'
  patch '/order_summaries/:id', controller: 'order_summaries', action: 'update'

  # DELETE
  delete '/order_summaries/:id', controller: 'order_summaries', action: 'destroy'
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get '/users/new', controller: 'users', action: 'new', as: 'new_user'
  post '/users', controller: 'users', action: 'create', as: 'users'

  # READ
  get '/users', controller: 'users', action: 'index'
  get '/users/:id', controller: 'users', action: 'show', as: 'user'

  # UPDATE
  get '/users/:id/edit', controller: 'users', action: 'edit', as: 'edit_user'
  patch '/users/:id', controller: 'users', action: 'update'

  # DELETE
  delete '/users/:id', controller: 'users', action: 'destroy'
  #------------------------------

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
