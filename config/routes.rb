Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index, :show] do
        resources :employees, only: [:index, :show]
      end
      resources :employees do
        resources :assets, only: [:index, :show]
        resources :documents, only: [:index, :show]
        resources :posting_histories, only: [:index, :show]
        resources :attendance_histories,  only: [:index, :show]
        resources :appraisal_histories, only: [:index, :show]
      end
      resources :document_types, only: [:index, :show]
      resources :asset_types, only: [:index, :show]
    end
  end

  resources :locations
end
