class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:])
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :name)
  end
end
