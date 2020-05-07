Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get '/configuration', to: "home#configuration"
  
  namespace :api do
    namespace :v1 do
      resources :asset_details, only: [:show]
      get 'new_employee_code/:loc_id', to: "code_records#new_code"
    end
  end
  # namespace :api do
  #   namespace :v1 do
  #     resources :locations, only: [:index, :show] do
  #       resources :employees, only: [:index, :show]
  #     end
  #     resources :employees do
  #       resources :assets, only: [:index, :show]
  #       resources :documents, only: [:index, :show]
  #       resources :posting_histories, only: [:index, :show]
  #       resources :attendance_histories,  only: [:index, :show]
  #       resources :appraisal_histories, only: [:index, :show]
  #     end
  #     resources :document_types, only: [:index, :show]
  #     resources :asset_types, only: [:index, :show]
  #   end
  # end
  resources :locations, only: [:new, :show, :index, :create]
  resources :document_types, only: [:new, :index, :create]
  resources :asset_details, only: [:new, :index, :create]

  resources :employees do
    resources :attendance_histories
    resources :appraisal_histories
    resources :posting_histories
    resources :documents, only: [:new, :create, :index]
    resources :assets, only: [:index, :new, :create]
  end
end
