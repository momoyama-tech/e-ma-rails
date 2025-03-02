Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resources :illusts
  namespace :verification do
    resources :illusts
  end

  mount ActionCable.server => "/cable"
end
