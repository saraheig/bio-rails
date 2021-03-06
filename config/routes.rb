Rails.application.routes.draw do
  root to: redirect('/tables')

  resources :users, only: %i[new create]
  resource :session, only: %i[new create destroy]
  get '/tables', to: 'tables#index'
  
  resources :works, path: '/tables/works'
  resources :categories, path: '/tables/categories'
  resources :topics, path: '/tables/topics'
  
  # Default route (if unknown url)
  match '*path' => redirect('/tables'), via: [:get, :post]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
