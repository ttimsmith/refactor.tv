Refactor::Application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about', as: 'about'
  
  # Feeds
  get 'feeds/:file_type', to: 'feeds#show', defaults: { format: 'xml' }
  
  # Episodes
  resources :episodes, only: [:show]
end
