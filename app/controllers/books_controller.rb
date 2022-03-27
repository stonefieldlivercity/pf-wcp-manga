class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @book = Book.new
    @rating = Rating.new
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      @rating = Rating.new(rating_params.merge(book_id: @book.id))
      @rating.save!
      redirect_to book_path(@book)
      #flash.now[:notice] = t('.notice.posted')
    else
      #flash.now[:alert] = t('.alert.failed')
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
  def destroy
    @book = Book.find(params[:id]).destroy
    redirect_to books_path
    #flash[:notice] = t('.notice.deleted')
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

