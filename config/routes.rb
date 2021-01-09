Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: redirect('/admin')

  namespace :admin do
    root to: "users#index"

    resources :users
    resources :reports,  only: [:index, :show, :destroy]
    resources :contacts, only: [:index, :show, :destroy]
  end
end
