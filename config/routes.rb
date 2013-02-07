Callcenter::Application.routes.draw do
  root to: 'calls#index'

  resources :calls, :only => [ :index, :show ]#, constraints: { id: /[\.]+/ }

  resources :gateways do
    resources :inbound_routes
    #resources :outbound_routes
    resource :outbound_route
  end
=begin
  Route.descendants.each do |klass|
    k = klass.model_name.pluralize.underscore.to_sym
    resources k, controller: 'routes', route: { kind: klass.model_name }
  end
=end

  resources :workplaces do
    resources :inbound_routes, controller: 'workplace_associations', kind_of_route: :inbound
    resources :outbound_routes, controller: 'workplace_associations', kind_of_route: :outbound
  end

  resources :groups do
    resources :participants
    resources :inbound_routes, controller: 'group_associations', kind_of_route: :inbound
    resource :outbound_route, controller: 'group_associations', kind_of_route: :outbound
  end

  resources :ivrs do
    resources :inbound_routes, controller: 'ivr_associations', kind_of_route: :inbound
    resource :outbound_route, controller: 'ivr_associations', kind_of_route: :outbound
  end

  #match 'test' => "groups#show", :id => 2

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
