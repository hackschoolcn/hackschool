Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :user do

    resources :services

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

  root 'welcome#index'
end
