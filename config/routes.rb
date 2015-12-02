Rails.application.routes.draw do
  root 'parents#start'

    get  'start' => 'parents#start', as: :start_parent
    get 'allparents' => "parents#allparent", as: :allparents_parents

    post 'addfriend' => 'children#addfriend', as: :friend_add
    post 'dropfriend' =>'children#dropfriend', as: :friend_drop

    post 'addschool' => "school_hobbies#addschool", as: :school_add
    post 'removeschool' => "school_hobbies#dropschool", as: :school_drop

    post 'keepchild' => "school_hobbies#keepchild", as: :school_keepchild


    get  'login' => 'sessions#new', as: :login
    post   'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'


  # devise_for :models

  resources :parents
  resources :children do
    resources :school_hobbies
  end

#join tables below (take out to test if improve School_hobbies_controller)
  resources :child_attendances, :families, :friendships


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
