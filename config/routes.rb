Refactor::Application.routes.draw do
  # Episodes
  root to: 'episodes#index'
  resources :episodes, only: [:show]  
  
  # Feeds
  get 'feeds/:file_type', to: 'feeds#show', defaults: { format: 'xml' }
  
  # Static pages
  get 'about', to: 'pages#about', as: 'about'
end
