# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :publications do
    resources :reviews
    resources :reserve_requests do
      member do
        post 'approve'
        delete 'disapprove'
      end
    end
  end
  get '/', to: 'home#index'
  get '/home', to: 'home#index'
end
