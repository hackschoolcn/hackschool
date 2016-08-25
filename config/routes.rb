Rails.application.routes.draw do
  devise_for :users

  resources :courses do
    collection do
      get :search
    end
    member do
      get :enroll
      post :member_confirm_enroll
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

    resources :faqs

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

    resources :settings do
      collection do
        get :edit_profile
        put :update_profile
        get :edit_password
      end
    end


    resources :tasks do
      resources :works
    end

    resources :courses do
      collection do
        get :search
      end
      member do
        post :enroll_course
        post :drop_course
      end

      resources :questions do
        collection do
          get :search
        end
      end

      resources :chapters
      resources :assignments
      resources :faqs
    end
    
    resources :questions do
      resources :answers
    end

    
    resources :questions do
      resources :answers
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
        post :yearly_subscription
        post :single_purchase
      end
      member do
        post :pay_with_wechat
        post :pay_with_alipay
        post :cancel_order
      end
    end
  end

end
