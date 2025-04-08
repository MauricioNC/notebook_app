Rails.application.routes.draw do
  root "home#index"
  resources :notebooks do
    resources :pages
  end
end
