Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts do
      resources :comments
  end
  resources :admins do
    member do
      patch :set
      put :set
      patch :remove
      put :remove
      patch :set
      put :set
      patch :blocked
      put :blocked
    end
  end
  root "posts#index"

end
