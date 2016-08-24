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
    resources :courses do # admin panel 课程与章 - chpwang
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

    resources :chapters do # admin panel 章与节 - chpwang
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

    resources :posts do # admin panel 任务与作业 - chpwang
      resources :tasks
    end

    resources :users do # admin panel 管理用户 - lanxin
      member do
        post :turn_to_user
        post :turn_to_admin
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "courses#index"

  namespace :account do

    resources :settings

    resources :tasks do # 任务与作业 - chpwang
      resources :works
    end


    resources :courses do # user panel 课程与章 - chpwang
      collection do
        get :search
      end
      resources :chapters
      member do
        post :enroll_course
      end
    end

    resources :chapters do # user panel 章与节 - chpwang
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

    resources :orders do # user panel 订单 - chpwang
      collection do
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
