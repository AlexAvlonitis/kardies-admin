Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: redirect('/admin')

  namespace :admin do
    resources :users
    resources :contacts, only: [:index, :show, :destroy]

    root to: "users#index"
  end
end
