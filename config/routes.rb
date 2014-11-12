TmunApp::Application.routes.draw do

  resources :badges

  resources :users do
    resources :badges
  end
  resources :frontpages
  resources :hconferences, :path => 'tritonmun'

  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]

  resources :questions

  root 'static_pages#home'


  match '/_update_hello', to: 'frontpages#update_hello', via: 'put'
  match '/travelteam/guides/', to: 'static_pages#guides', via: 'get'
  match '/travelteam/training/', to: 'static_pages#training', via: 'get'
  match '/travelteam/upcoming/', to: 'static_pages#upcoming', via: 'get'
  match '/travelteam/resources/', to: 'static_pages#resources', via: 'get'
  match '/travelteam/past/', to: 'static_pages#past', via: 'get'

  match '/admintools',  to: 'users#admintools',         via: 'get'

  match '/tritonmun/:number',  to: 'hconferences#show',         via: 'get'

  match '/tritonmun/all',  to: 'hconferences#all',         via: 'get'


  match '/tritonmun/:id/locations',    to: 'hconferences#locations',     via: 'get'
  match '/tritonmun/:id/register',    to: 'hconferences#register',     via: 'get'
  match '/tritonmun/:id/committees',  to: 'hconferences#committees',   via: 'get'
  match '/tritonmun/:id/speakers',  to: 'hconferences#speakers',   via: 'get'
  match '/tritonmun/:id/position_papers',  to: 'hconferences#position_papers',   via: 'get'
  match '/tritonmun/:id/research',  to: 'hconferences#research',   via: 'get'

  match '/signup',  to: 'users#new',              via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  # match '/tritonmun/new',  to: 'hconferences#create',         via: 'get'
  #match '/tritonmun/all',  to: 'hconferences#index',         via: 'get'
  # match '/tritonmun/:number',  to: 'hconferences#show',         via: 'get'

  match '/app',    to: 'static_pages#app',    via: 'get'

  match '/x',    to: 'static_pages#x',    via: 'get'
  match '/commitees',    to: 'static_pages#commitees',    via: 'get'
  match '/staff',    to: 'static_pages#staff',    via: 'get'
  match '/register',    to: 'static_pages#register',    via: 'get'

  match '/travelteam',    to: 'static_pages#travelteam',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'

  match '/tritonmun/new/#',   to: 'hconferences#add_question',   via: 'get'

  match '/participate',   to: 'static_pages#participate',   via: 'get'

  match '/mission',   to: 'static_pages#mission',   via: 'get'
  match '/secretariat',   to: 'static_pages#secretariat',   via: 'get'
  match '/history',   to: 'static_pages#history',   via: 'get'
  match '/alumni',   to: 'static_pages#alumni',   via: 'get'

  match '/calendar',   to: 'static_pages#calendar',   via: 'get'

  match '/tritonmun', to: 'hconferences#index', via: 'get'
  match '/hconference/all', to: 'hconferences#all', via: 'get'


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
