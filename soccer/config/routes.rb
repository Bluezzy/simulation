Rails.application.routes.draw do
  root "home#index"
  resources :championships do
    resources :teams
  end
end
