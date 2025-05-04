Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resources :emas, only: [ :index, :show, :create ], defaults: { format: :json }
  resources :old_emas, only: [ :index ], defaults: { format: :json }
  namespace :verification do
    resources :illusts
  end

  mount ActionCable.server => "/cable"
end
