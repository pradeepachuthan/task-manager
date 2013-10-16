Task::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'ticket#index'

  resources :ticket, only: [:show, :new, :create]

  post "sign_in" => "authentication#login"
  get "sign_in" => "authentication#sign_in"
  get "sign_out" => "authentication#sign_out"
  # create a new user
  get "new_user" => "authentication#new_user"

  get "admin" => "admin#index"
  get "admin/ticket" => "admin#show_ticket"
  get "admin/ticket/:id" => "admin#show_ticket"
  post "admin/ticket/:id" => "admin#response_on_ticket"
  get "admin/tickets" => "admin#show_tickets"
  get "admin/tickets/:status" => "admin#show_tickets"
  get "admin/ticket/find/:query" => "admin#find_ticket"

  get 'new' => 'ticket#new'

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