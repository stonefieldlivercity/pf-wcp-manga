class RatingsController < ApplicationController
#ログインの有無を判別
  before_action :authenticate_user!
# この評価に紐づく投稿を検出
  before_action :set_book
# 評価投稿ページ
  def new
    @rating = @book.ratings.build
  end
# 評価投稿機能
  def create
    @rating = @book.ratings.new(rating_params.merge(user_id: current_user.id))
    rated_count = Rating.where(book_id: params[:book_id]).where(user_id: current_user.id).count
    if @rating.valid?
# 投稿を１ユーザー１回に制限する
      if rated_count < 1
        @rating.save!
        redirect_to book_path(@book)
        flash[:notice] = t('notice.posted')
      else
        redirect_to new_book_rating_path
        flash[:alert] = t('notice.alredy_taken')
      end
    else
      flash.now[:alert] = t('notice.not_saved')
      render 'new'
    end
  end
# 評価削除機能
  def destroy
    @rating = Rating.find(params[:id]).destroy
    redirect_to book_path(@book)
    flash[:notice] = t('notice.deleted')
  end

  private

  def set_book
    @book = Book.find_by(id: params[:book_id])
  end
# ストロングパラメータ
  def rating_params
    params.require(:rating).permit(:cool, :cute, :hot, :relax, :emotion, :funny, :complex, :brisk)
  end
end
