Rails.application.routes.draw do
  get 'courses/index'
  get 'courses/show'
  get 'courses/new'
  get 'courses/edit'
  devise_for :users

  resources :courses do
    resources :lessons, except: [:index]
  end

  root "courses#index"
end
