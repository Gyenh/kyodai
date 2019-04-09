Rails.application.routes.draw do

  root 'homepages#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :posts do
    resources :comments
  end

  mount Ckeditor::Engine => '/ckeditor'
  resources :articles

end
