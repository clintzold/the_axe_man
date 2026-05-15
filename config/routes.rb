Rails.application.routes.draw do
  namespace :admin do
    get "recent_jobs/:job_id/images/:id", to: "recent_jobs#remove_image", as: :remove_recent_job_image
    resources :recent_jobs
    resources :testimonials, except: [ :show ]
    resources :jobs
    # Image Control
    get "blobs/:name", to: "blobs#destroy_orphan_image"
    root to: "dashboard#index", as: :dashboard
  end
  resource :session
  resources :passwords, param: :token
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "home", to: "pages#index", as: :home
  get "about", to: "pages#about"
  get "services", to: "pages#services", as: :services

  get "jobs", to: "jobs#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#index"
end
