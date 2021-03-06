Rails.application.routes.draw do
  get 'attendees/join'

  get 'events/index'

  root "users#index"
  #User routes#####################################################One to Many with events, Many to Many to events through attendee 
  post "/users" => "users#create"
  get "/users/:id/edit" => "users#edit"
  patch "users/:id" => "users#update"

  #Event routes ########################################################
  get "/events" => "events#index"
  post "/events" => "events#create"
  get "/events/:id/edit" => "events#edit"
  get "/events/:id/show" => "events#show"
  post "/events/:id" => "events#comment"
  patch "/events/:id" => "events#update"
  delete "/events/:id" => "events#destroy"

  #Session routes ######################################################
  post "/sessions" => "sessions#login"
  get "sessions"   => "sessions#logout"

  #Attendee routes#######################################################
  get "/events/:id/join" => "attendees#join"
  delete "/attendees/:event_id/delete" => "attendees#destroy"
 
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
