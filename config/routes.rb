Rails.application.routes.draw do

  resources :messages
  resources :athletes
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
    resource :draft do
      post 'setup_draft'
    end
    resources :draft_picks
  end

  mount ActionCable.server, at: '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
