Tc::Application.routes.draw do
  
  resources :sessions, :only => [:new, :create, :destroy]
  resources :pages
  resources :jobs
  resources :posts
  get "home/index"
  post "contacts/create"
  post "events/create"
  post "enquiries/create"
  post "jobs/create"
  
  match "home" => "home#index"
  match "tenants" => "home#tenants"
  match "community" => "home#community"
  match "mission" => "home#mission"
  # match "news" => "home#news" 
  match "events" => "home#events"  
  match "jobs" => "home#jobs"
  match "surf" => "home#surf"
  
  match '/' => 'home#surf', :constraints => { :subdomain => "surf"}
  
  
  
  match "/signin", :to => "sessions#new"
  match "/signout", :to => "sessions#destroy"
  match "/admin", :to => "admin#index"
  match "/admin/pages/:action/" => "pages#:action" 
  match "/admin/pages/:action/:id" => "pages#:action"
  match "/admin/posts/:action/" => "posts#:action" 
  match "/admin/posts/:action/:id" => "posts#:action"
  match "/news" => "pages#news"
  match "/news/:post" => "posts#show"
  match '/:url' => 'pages#show'     
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
