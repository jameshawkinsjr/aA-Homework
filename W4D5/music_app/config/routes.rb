Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :show, :create]
  resources :bands, except: [:show]
  resources :bands, only: [:show] do 
    resources :albums, only: [:show]
  end
  resources :albums, except: [:show] do 
    resources :tracks, only: [:show]
  end
  resources :tracks, except: [:show]
end
