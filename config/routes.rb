Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :contacts, except: [:edit, :update]

    root to: "users#index"
  end
end
