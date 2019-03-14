Rails.application.routes.draw do
  devise_for :users

  root 'homepages#index'

end
