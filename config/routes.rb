Rails.application.routes.draw do
  devise_for :users

  resources :questions do
    resources :answers
  end

  resources :courses do
    resources :plans, only: [:index]
  end

  namespace :admin do
    resources :chapters
    resources :sections
    resources :courses do
      member do
        post :hide
        post :publish
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'courses#index'

  resources :welcome

  namespace :account do
    resources :orders do
      collection do
        post :quarterly_subscription
        post :yearly_subscription
      end

      member do
        post :pay_with_wechat
        post :pay_with_alipay
        post :cancel_order
      end
    end
  end

  resources :groups
end
