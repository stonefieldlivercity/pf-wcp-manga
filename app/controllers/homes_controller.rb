class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @books = Book.limit(3).sort_books(sort: 'favorited_desc')
    @rating = Rating.find_by(book_id: @books.map(&:id))
  end

  def language
    session[:locale] = params[:lang]
    redirect_back(fallback_location: "/")
  end
end
