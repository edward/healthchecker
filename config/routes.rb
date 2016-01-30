Rails.application.routes.draw do
  resources :opinions, only: [:create, :update, :destroy]
  root controller: :healthchecks, action: :index

  # make this work: healthchecker.edward.bio/123-uuid-LKJLKJ
  get '/h/:handle', to: 'healthchecks#show', as: 'healthcheck'
  resources :healthchecks, only: [:index, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
