Rails.application.routes.draw do

  resources :questions
  resources :attempts
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
# uncomment the following line to reenable registration from the mobile app
#    resources :users, param: :access_token
    post   'quizzes' => 'quizzes#index'
    post   'quizzes/:id' => 'quizzes#show'
#    resources :password_resets, only: [:new, :create, :edit, :update]
  end

end
