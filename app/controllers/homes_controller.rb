class HomesController < ApplicationController
  def top
    @genres = Genre.all
    @books = Book.limit(3).sort_books(sort: 'favorited_desc')
    p @rating = Rating.find_by(book_id: @books.map(&:id))
  end

  def about
  end
end
