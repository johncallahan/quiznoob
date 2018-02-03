Rails.application.routes.draw do

  devise_for :admins

#  root 'welcome#welcome'

  authenticate :admin do
    root 'users#index'
    resources :redemptions
    resources :awards
    resources :rewards
    resources :answers
    resources :subjects
    resources :answers
    resources :questions do
      collection do
        post :import
	      post :export
      end
    end
    resources :attempts
    resources :quizzes do
      member do
        post :toggle
      end
      collection do
        post :import
	      post :export
      end
    end
    get    'signup'  => 'users#new'
    get    'login'   => 'sessions#new'
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get    'verify'  => 'sessions#verify_access_token'
    resources :users do
      member do
        get 'reset'
      end
    end
    resources :password_resets, only: [:new, :create, :edit, :update]
  end

  namespace :api do
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get    'verify'  => 'sessions#verify_access_token'
    post   'user' => 'users#show'
    post   'users' => 'users#index'
    post   'subjects' => 'subjects#index'
    post   'subjects/:id' => 'subjects#show'
    post   'quizzes' => 'quizzes#index'
    post   'quizzes/:id' => 'quizzes#show'
    post   'questions/:id' => 'questions#show'
    post   'attempts' => 'attempts#create'
    post   'rewards' => 'rewards#index'
    post   'rewards/:id' => 'rewards#show'
    post   'bonuses' => 'bonuses#create'
    post   'bonuses/:id' => 'bonuses#show'
    post   'redemptions' => 'redemptions#create'
  end

end
