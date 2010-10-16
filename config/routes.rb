Salud::Application.routes.draw do

  root :to => 'user_sessions#new'

  resources :users
  resources :user_sessions
  resources :tipo_mantenimientos
  resources :equipos

  match 'login' => "user_sessions#new",      :as => :login
  match 'logout' => "user_sessions#destroy", :as => :logout

  get "users/index"
  get "user_sessions/new"

  match '/equipos' => 'equipos#index', :via => :get, :as => :equipos
  match '/equipo/:id/hojavida' => 'hoja_vida#show', :via => :get, :as => :hoja_vida
  match '/equipos/search' => 'equipos#search', :via => :post
  match '/equipos/autocomplete' => 'equipos#autocomplete', :via => :get
  match '/autocomplete_repuestos' => 'reportes#autocomplete', :via => :get
  match '/equipo/:equipo_id/agenda/:id/reporte/new' => 'reportes#new', :via => :get, :as => :new_reporte
  match '/equipo/:equipo_id/agenda/:id/reporte/new' => 'reportes#create', :via => :post, :as => :create_reporte
  match '/equipo/:equipo_id/agenda/:agenda_id/reporte/:id' => 'reportes#show', :via => :get, :as => :reporte
	match '/find_by_cc' => 'reportes#find_by_cc', :via => :post, :as => :find_by_cc
	match '/add_estado_equipo' => 'reportes#add_estado_equipo', :via => :post, :as => :add_estado_equipo
	match '/equipo/:id/agendas' => 'agenda#index', :via => :get, :as => :agendas
	match '/equipo/:id/agendas/new' => 'agenda#new', :via => :get, :as => :new_agenda
	match '/equipo/:id/agendas' => 'agenda#create', :via => :post, :as => :agendas
	match '/equipo/:equipo_id/agendas/:id' => 'agenda#edit', :via => :get, :as => :edit_agenda
	match '/equipo/:equipo_id/agendas/:id' => 'agenda#update', :via => :put, :as => :agenda
	match '/equipo/:equipo_id/agendas/:id' => 'agenda#destroy', :via => :delete, :as => :agenda
	match '/agenda' => 'agenda#general', :via => :get, :as => :agenda_general
	match '/autogenerate' => 'autogenerar#new', :via => :get, :as => :new_autogenerar
	match '/autogenerate' => 'autogenerar#create', :via => :post, :as => :autogenerar
	match '/autogenerate/validate_date' => 'autogenerar#validate_date', :via => :get, :as => :validate_date

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
