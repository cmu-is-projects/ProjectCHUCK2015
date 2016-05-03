ProjectChuck2015::Application.routes.draw do

  resources :roster_spots

  resources :guardians

  resources :households

  resources :schools

  resources :volunteers

  resources :tournaments

  resources :brackets

  resources :teams

  # resources :locations

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
        get :birth_certificate_reset
        get :report_card
        get :report_card_checkoff
        get :report_card_deny
        get :report_card_reset
        get :proof_of_insurance
        get :proof_of_insurance_checkoff
        get :proof_of_insurance_deny
        get :proof_of_insurance_reset
        get :physical
        get :physical_checkoff
        get :physical_deny
        get :physical_reset
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
  get 'home/schedule' => 'home#schedule', as: :schedule
  get 'home/standings' => 'home#standings', as: :standings
  get 'home/analytics' => 'home#analytics', as: :analytics
  get 'home/download_data' => 'home#download_data', as: :download_data
  get 'home/control_panel' => 'home#control_panel', as: :control_panel
  get 'home/instructions' => 'home#instructions', as: :instructions
  get 'home/create_student_user' => 'home#create_student_user', as: :create_student_user
  get 'home/manage_tournament' => 'home#manage_tournament', as: :manage_tournament

  get 'registerstudent', to: 'students#new', :as => :registerstudent
  get 'registervolunteer', to: 'volunteers#new', :as => :registervolunteer
  get 'registerguardian', to: 'guardians#new', :as => :registerguardian
  get 'registerhousehold', to: 'households#new', :as => :registerhousehold

  get 'assign_student/:id' => 'teams#assign_student', as: :assign_student
  get 'send_assign_student/:team_id/:student_id' => 'teams#send_assign_student', as: :send_assign_student
  get 'assign_coach/:id' => 'teams#assign_coach', as: :assign_coach
  get 'send_assign_coach/:team_id/:volunteer_id' => 'teams#send_assign_coach', as: :send_assign_coach

  get 'vol_assign_coach/:team_id/:volunteer_id' => 'volunteers#vol_assign_coach', as: :vol_assign_coach
  get 'stu_send_assign_student/:team_id/:student_id' => 'students#send_assign_student', as: :stu_send_assign_student
  get 'send_remove_student/:student_id' => 'students#send_remove_student', as: :send_remove_student
  get 'send_remove_volunteer/:volunteer_id' => 'volunteers#send_remove_volunteer', as: :send_remove_volunteer

  get 'physical_view_student/:id' => 'students#physical_view_student', as: :physical_view_student
  get 'report_card_view_student/:id' => 'students#report_card_view_student', as: :report_card_view_student

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
