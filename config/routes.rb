Rails.application.routes.draw do
  get "jobs/index"
 
  get "up" => "rails/health#show", as: :rails_health_check

  resources :jobs

  root 'jobs#index'

end
