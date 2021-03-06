Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path_names: {
    sign_up: ''
  }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  namespace :api do
    get 'events' => '/event#list'
    get 'events/:event_id' => '/event#detail'
    get 'events/:event_id/photos' => '/event#photos'
    get 'feed' => '/posts#feed'
    get 'recent_news' => '/posts#recent'
    get 'news' => '/posts#list'
    get 'posts/:post_id' => '/posts#detail'
    get 'posts' => '/posts#list'
    get 'agents' => '/agents#list'
    get 'agents/:agent_type' => '/agents#list_type'
    get 'agents/:agent_type/:agent_id' => '/agents#detail'
    get 'skateparks-list/:region_id' => '/skateparks#list'
    get 'skateparks/:skatepark_id' => '/skateparks#detail'
    get 'search' => '/welcome#search'
    get 'banners' => '/welcome#banners'
    get 'about' => '/welcome#about'
    post 'subscribe' => '/welcome#subscribe'
  end

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
