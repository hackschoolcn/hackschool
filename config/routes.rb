Rails.application.routes.draw do
  devise_for :users

  resources :courses do
    member do
      get :enroll
      post :member_confirm_enroll
      post :join_favorite
      post :cancel_favorite
    end
  end

  resources :plans, only: [:index]

  namespace :admin do
    resources :courses do
      resources :chapters do
        collection do
          get :search     # 搜索A课程内容 admin > course > chapter > search
        end
        resources :posts  # 显示搜到的A课程内容 admin > course > chapter > post
        member do
          post :hide
          post :publish
          post :higher_chapter
          post :lower_chapter
        end
      end

      resources :faqs # admin课程下的FAQ admin > course > faq

      member do
        post :hide
        post :publish
        post :dismiss_course
        post :start_course
        get :edit_course
      end
    end

    resources :chapters do
      resources :posts do
        member do
          post :hide
          post :publish
          post :higher_post
          post :lower_post
        end
      end
    end

    resources :posts do
      resources :tasks
    end

    resources :tasks do
      resources :works
    end

    resources :users do
      member do
        post :turn_to_user
        post :turn_to_admin
      end

      collection do
        get :user_paid
      end
    end

    # faqs routes
    resources :faqs
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "courses#index"

  resources :notifications do #提醒栏
    collection do
      post :mark_as_read
    end
  end

  namespace :account do
    resources :settings do
      collection do
        get :edit_profile
        put :update_profile
        get :edit_password
      end
    end

    resources :favorites #课程收藏

    resources :tasks do
      resources :works
    end

    resources :courses do

      resources :questions do
        collection do
          get :search # 搜索A课程讨论区内容 account > course > question > search
        end
        resources :answers # 显示搜到的A课程讨论区内容 account > course > question > answer
      end

      resources :chapters do
        collection do
          get :search     # 搜索A课程内容 account > course > chapter > search
        end
        resources :posts  # 显示搜到的A课程内容 account > course > chapter > post
      end
      resources :assignments
      resources :faqs
    end

    resources :questions do
      resources :answers
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
        post :yearly_subscription_from_course_view
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
