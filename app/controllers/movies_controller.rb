class MoviesController < ApplicationController
  before_action :set_find_movie, only: %i[show edit update destroy]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(list_params)
    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render :new
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private
  def list_params
    params.require(:movie).permit(:title, :overview, :poster_url)
  end

  def set_find_movie
    @movie = Movie.find(params[:id])
  end
end
