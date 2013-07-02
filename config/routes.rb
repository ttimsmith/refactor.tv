Refactor::Application.routes.draw do
  # Episodes
  root to: 'episodes#index'

  # Static pages
  get 'about', to: 'pages#about', as: 'about'

  # Episode
  get ':id', to: 'episodes#show', as: 'episode'
end
