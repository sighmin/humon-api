Rails.application.routes.draw do
  scope module: :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :events, only: [:show, :create, :update]
    end
  end
end
