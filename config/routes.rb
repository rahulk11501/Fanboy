Rails.application.routes.draw do
  root to: 'main#index'

  get 'movie/top_movies'
  get 'movie/search_movie'
  get 'movie/reviews'

  resources :movie

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
