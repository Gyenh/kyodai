Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  resources :articles

  root 'homepages#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :posts do
    resources :comments
  end

end
