Rails.application.routes.draw do


  get "users" => "users#index"
  get "users/new" => "users#new"
  post "users" => "users#create"

  get '/login'     => 'sessions#new'
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'articles/:article_id/comments' => 'comments#index', as: :article_comments
  post 'articles/:article_id/comments' => 'comments#create'
  get 'articles/:article_id/comments/new' => 'comments#new', as: :new_article_comment
  get 'articles/:article_id/comments/:id/edit' => 'comments#edit', as: :edit_article_comment
  get 'articles/:article_id/comments/:id' => 'comments#show', as: :article_comment
  patch 'articles/:article_id/comments/:id' => 'comments#update'
  put 'articles/:article_id/comments/:id' => 'comments#update'
  delete 'articles/:article_id/comments/:id' => 'comments#destroy'

  get 'articles' => 'articles#index', as: :articles
  post 'articles' => 'articles#create'
  get 'articles/new' => 'articles#new', as: :new_article
  get  'articles/:id/edit' => 'articles#edit', as: :edit_article
  get 'articles/:id' => 'articles#show', as: :article
  patch  'articles/:id' => 'articles#update'
  put 'articles/:id' => 'articles#update'
  delete 'articles/:id' => 'articles#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  get 'home' => 'welcome#home'
  get 'about' => 'welcome#about'
  root 'welcome#index'

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
