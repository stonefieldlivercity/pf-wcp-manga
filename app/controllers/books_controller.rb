class BooksController < ApplicationController
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
    else
      render 'new'
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @rating = Rating.find_by(book_id: params[:id])
  end

  def search
    @books = Book.search(params[:word])
    p @word = params[:word]
    redirect_to result_path
  end

  def result
    @books = Book.search(params[:word])
    @word = params[:word]
  end

  private

  def book_params
    params.require(:book).permit(:title, :name, :genre_id)
  end

  def rating_params
    params.require(:rating).permit(:cool, :cute, :hot, :relax, :emotion, :funny, :complex, :brisk)
  end
end
