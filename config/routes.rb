Refactor::Application.routes.draw do
  # Episodes
  root to: 'episodes#index'

  # Feeds
  get 'feeds/:file_type', to: 'feeds#show', defaults: { format: 'xml' }, as: 'feeds'

  # Static pages
  get 'about', to: 'pages#about', as: 'about'

  # Episode
  get ':id', to: 'episodes#show', as: 'episode'
end
