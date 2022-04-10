class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :result]
  before_action :ensure_admin, only: [:destroy]
# 新規投稿ページ
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params.merge(user_id: current_user.id))
    if @book.save
      @rating = Rating.new(rating_params.merge(user_id: current_user.id, book_id: @book.id))
      @rating.save
      redirect_to book_path(@book)
      flash[:notice] = t('notice.posted')
    else
      render "new"
    end
  end

  def index
    if sort_params.present?
      @books = Book.sort_books(sort_params)
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
    if user_signed_in?
      @rating = Rating.find_by(book_id: params[:id], user_id: current_user.id)
    else
      @rating = Rating.find_by(book_id: params[:id])
    end
  end
#検索結果ページ
  def result
    @word = params[:word]
    @books = Book.search(params[:word]).sort_books(sort_params)
  end

  def destroy
    @book = Book.find(params[:id]).destroy
    flash[:notice] = t('notice.deleted')
    redirect_to books_path
  end

  private
#管理者権限を判別
  def ensure_admin
    unless current_user.admin?
      redirect_to "/"
    end
  end

  def book_params
    params.require(:book).permit(:title, :name, genre_ids: [])
  end

  def sort_params
    params.permit(:sort)
  end

  def rating_params
    params.require(:rating).permit(:cool, :cute, :hot, :relax, :emotion, :funny, :complex, :brisk)
  end
end
