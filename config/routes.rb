Rails.application.routes.draw do

  root 'static_pages#home'

  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, shallow: true do
    resources :teams
  end

  resources :leagues, shallow: true do
    resources :teams, except: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
