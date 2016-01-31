Rails.application.routes.draw do
  resources :opinions, only: [:create, :update, :destroy]
  root controller: :healthchecks, action: :index

  get '/h/:handle', to: 'healthchecks#show', as: 'healthcheck_handle'
  put '/h/:handle/lock', to: 'healthchecks#lock',as: 'lock_healthcheck_handle'
  resources :healthchecks, only: [:index, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
