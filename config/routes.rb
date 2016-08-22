Rails.application.routes.draw do
  devise_for :users

  resources :questions do
    resources :answers
  end

  namespace :search do
    resources :questions do
      collection do
        get :search
      end
    end
    resources :courses do
      collection do
        get :search
      end
    end
  end

  resources :courses do
    resources :plans, only: [:index]
  end

  namespace :admin do

    resources :courses do

      resources :chapters do
        member do
          post :hide
          post :publish
        end
      end

      member do
        post :hide
        post :publish
      end
    end

    resources :chapters do

      resources :posts do
        member do
          post :hide
          post :publish
        end
      end

    end

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'courses#index'


  namespace :account do

    resources :courses do
      resources :chapters
    end

    resources :chapters do
      resources :posts do
        member do
          post :prev
          post :next
        end
      end
    end

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
