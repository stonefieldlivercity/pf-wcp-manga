class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
    @rating = Rating.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @rating = @book.ratings.new(rating_params)
    if @book.save
      @rating.save
      redirect_to book_path(@book)
      flash[:notice] = "投稿しました"
    else
      flash.now[:alert] = "投稿失敗しました"
      render 'new'
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
    @rating = Rating.find_by(book_id: params[:id])
  end

  def result
    @word = params[:word]
    @books = Book.search(params[:word])
  end

  private

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
