Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      get 'movies/consult_movie_by_name' => 'movies#consult_movie_by_name'
      get 'movies/consult_movie_by_id' => 'movies#consult_movie_by_id'
    end
  end
end
