Rails.application.routes.draw do
  scope module: :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :events do
        resources :nearests, only: [:index]
      end
      resources :events, only: [:show, :create, :update]
    end
  end
end
