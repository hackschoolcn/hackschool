Rails.application.routes.draw do
  devise_for :users
  resources :courses
  namespace :admin do
    resources :courses do
      member do
        post :hide
        post :publish
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'courses#index'
end
