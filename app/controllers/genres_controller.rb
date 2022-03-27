class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @books = @genre.books
  end

  def new
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    if @genre.save
      flash.now[:notice] = t('notice.created')
    else
      render 'new'
    end
  end

  def destroy
    @genre = Genre.find(params[:id]).destroy
    flash.now[:notice] = t('notice.deleted')
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
