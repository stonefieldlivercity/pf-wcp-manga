class GenresController < ApplicationController
#ログインの有無
  before_action :authenticate_user!, except: [:show]
#管理者ユーザーの判別
  before_action :ensure_admin, only: [:new, :create, :destroy]
# ジャンル検索ページ
  def show
    @genre = Genre.find(params[:id])
    @books = @genre.books
  end
# ジャンル編集ページ
  def new
    @genre = Genre.new
    @genres = Genre.all
  end
# ジャンル作成ページ
  def create
    @genre = Genre.new(genre_params)
    @genres = Genre.all
    if @genre.save
      flash.now[:notice] = t('notice.created')
    else
      flash.now[:alert] = t('notice.not_saved')
    end
  end
# ジャンル削除ページ
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
# ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name)
  end
end
