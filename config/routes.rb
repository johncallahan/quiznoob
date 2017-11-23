Rails.application.routes.draw do

  devise_for :admins

  authenticate :admin do
  resources :quizzes
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'verify'  => 'sessions#verify_access_token'
  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
  end

  root 'welcome#welcome'

  namespace :api do
    post   'login'   => 'sessions#create'
    delete 'logout'  => 'sessions#destroy'
    get    'verify'  => 'sessions#verify_access_token'
#    resources :users, param: :access_token
    post   'quizzes' => 'quizzes#index'
#    resources :password_resets, only: [:new, :create, :edit, :update]
  end

end
