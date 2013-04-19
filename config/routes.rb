ShameIndia::Application.routes.draw do
   
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
    #devise_for :users
  #match "/texting"  => "postings#texting"   
  resources :postings do
    
    resources :comments
  end
   resources :polls do
    resources :poll_answers 
   end

  match "/postings/:posting_id/comments" => "comments#create", :as => 'create_comment'
  match "/postings/:posting_id/add_post_like" => "postings#add_post_like", :as => 'add_post_like'
  match "/postings/:posting_id/add_post_unlike" => "postings#add_post_unlike", :as => 'add_post_unlike'
  #match "/polls/:posting_id/add_like" => "postings#add_like", :as => 'add_like'
  match "/polls/:poll_id/create_poll_answer" => "polls#create_poll_answer", :as => "create_poll_answer", :method=> :put 
  
  resources :activities
  root :to => "postings#index"
  match "auth/:provider/callback" => 'sessions#create'
  match "/signout" => "sessions#destroy", :as => :signout

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
