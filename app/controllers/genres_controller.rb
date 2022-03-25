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
      flash.now[:notice] = "保存完了しました"
    else
      flash.now[:alert] = "保存失敗しました"
    end
  end

  def destroy
    @genre = Genre.find(params[:id]).destroy
    flash.now[:notice] = "削除しました"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
