class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @books = @genre.books
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
