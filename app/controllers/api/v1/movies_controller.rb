class Api::V1::MoviesController < Api::V1::ApiController
  def consult_movie_by_name
    key = %w(imdbID Title Year Genre)
    hash_full = ApiMovies.get_movies_by_name(params[:name])
    hash_filter = {movie: hash_full.filter{|b| b.in?(key)}}
    if hash_filter[:movie].present?
      render json: { status: 200, movies: hash_filter }, status: :ok, content_type: 'application/json'
    else
      render status: 400, json: {status: 400, message: "Nenhum filme encontrado", movies: hash_filter}
    end
  end

  def consult_movie_by_id
    key = %w(imdbID Title Year Genre)
    hash_full = ApiMovies.get_movies_by_id(params[:id])
    hash_filter = {movie:hash_full.filter{|b| b.in?(key)}}
    if hash_filter[:movie].present?
      render json: { movies: hash_filter }, status: :ok, content_type: 'application/json'
    else
      render status: 400, json: {status: 400, message: "Nenhum filme encontrado", movies: hash_filter}
    end
  end
end
