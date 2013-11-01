EmberApp::Application.routes.draw do
  namespace :api do
    resources :books, only: [ :index, :create ]
  end
  root to: "home#index"
end
