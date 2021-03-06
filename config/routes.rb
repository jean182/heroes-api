Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :universes
      resources :heroes
    end
  end
  match "*a", to: "api/v1/errors#routing", via: %i[get post]
end
