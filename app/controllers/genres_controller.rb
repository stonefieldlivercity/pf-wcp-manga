class GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_admin, only: [:new, :create, :destroy]

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
      flash.now[:alert] = t('notice.not_saved')
    end
  end

  def destroy
    @genre = Genre.find(params[:id]).destroy
    flash.now[:notice] = t('notice.deleted')
  end

  private
#管理者権限を判別
  def ensure_admin
    unless current_user.admin?
      redirect_to "/"
    end
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
