ProjectChuck2015::Application.routes.draw do

  resources :roster_spots

  resources :guardians

  resources :households

  resources :schools

  resources :volunteers

  resources :tournaments

  resources :brackets

  resources :teams

  resources :locations

  resources :games

  resources :team_games

  resources :registrations

  resources :users

  resources :students do
      member do 
        put :change_active
        get :birth_certificate
        get :birth_certificate_checkoff
        get :birth_certificate_deny
        get :report_card
        get :report_card_checkoff
        get :report_card_deny
        get :proof_of_insurance
        get :proof_of_insurance_checkoff
        get :proof_of_insurance_deny
        get :physical
        get :physical_checkoff
        get :physical_deny
      end
  end
  
  resources :sessions

  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout

  get 'survey' => 'households#survey', :as => :survey

  # semi-static routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/notifications' => 'home#notifications', as: :notifications

  get 'registerstudent', to: 'households#new', :as => :registerstudent
  get 'registervolunteer', to: 'volunteers#new', :as => :registervolunteer

  # set the root url
  root to: 'home#index'

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
