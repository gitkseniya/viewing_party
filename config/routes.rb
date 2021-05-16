Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'welcome#index'

    resources :users, only: [:new, :create]
    get '/profile', to: 'users#show'

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/logout', to: 'sessions#destroy'

    get "/dashboard", to: "dashboard#index"
    get "/discover", to: "discover#index"
    get "/movies", to: "movies#index"
end
