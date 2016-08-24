Rails.application.routes.draw do
  devise_for :users

  resources :questions do
    collection do
      get :search
    end
    resources :answers

  end

  resources :courses do
    collection do
      get :search
    end
  end

  resources :plans, only: [:index]

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
      collection do
        get :search
      end
      resources :posts do
        member do
          post :hide
          post :publish
        end
      end
    end

    resources :posts do
      resources :tasks

    end

    resources :users do
      member do
        post :turn_to_user
        post :turn_to_admin
      end
    end

    #faqs routes
    resources :faqs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "courses#index"

  namespace :account do

    resources :settings

    resources :faqs

    resources :tasks do
      resources :works
    end


    resources :courses do
      collection do
        get :search
      end
      resources :chapters
      member do
        post :enroll_course
        post :drop_course
      end
    end

    resources :chapters do
      collection do
        get :search
      end
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
