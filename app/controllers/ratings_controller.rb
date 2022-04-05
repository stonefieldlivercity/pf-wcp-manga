class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  def new
    @rating = @book.ratings.build
  end

  def create
    @rating = @book.ratings.new(rating_params.merge(user_id: current_user.id))
    if @rating.save
      redirect_to book_path(@book)
      flash[:notice] = t('notice.posted')
    else
      flash.now[:alert] = t('notice.not_saved')
      redirect_back(fallback_location: 'new')
    end
  end

  def destroy
    @rating = @book.ratings.destroy
    flash[:notice] = t('notice.deleted')
  end

  private

  def set_book
    @book = Book.find_by(params[:book_id])
  end

  def rating_params
    params.require(:rating).permit(:cool, :cute, :hot, :relax, :emotion, :funny, :complex, :brisk)
  end
end
