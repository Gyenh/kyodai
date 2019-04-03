Rails.application.routes.draw do

  #root 'homepages#index'
  root 'homepages#test'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :posts do
    resources :comments
  end

end
