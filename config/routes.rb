Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  root             "static_pages#home"
  get "home"    => "static_pages#home"
  get "about"   => "static_pages#about"
  get "contact" => "static_pages#contact"

  resources :users, only: [:index]
  namespace :supervisor do
    resources :users, only: [:index]
    resources :subjects
    resources :courses_subjects
  end
end
