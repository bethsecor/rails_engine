Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'merchants/find', to: 'merchants/find#show', defaults: { format: :json }
      get 'merchants/find_all', to: 'merchants/find#index', defaults: { format: :json }
      resources :merchants, only: [:show, :index], defaults: { format: :json }
    end
  end
end
