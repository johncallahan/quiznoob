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
    resources :questions
    resources :attempts
    resources :quizzes do
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
    resources :users
    resources :password_resets, only: [:new, :create, :edit, :update]
  end

  namespace :api do
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get    'verify'  => 'sessions#verify_access_token'
    post   'users' => 'users#show'
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
