class RatingsController < ApplicationController
  #def create
    #@book = Book.find(params[:book_id])
    #@rating = @book.ratings.new(book_id: @book.id)
    #@rating.save
  #end

  private

  def rating_params
    params.require(:rating).permit(:book_id, :cool, :cute, :hot, :relax, :emotion, :funny, :complex, :brisk)
  end
end
