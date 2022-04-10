class UsersController < ApplicationController
#ログインの有無を判別 
  before_action :authenticate_user!
#現在のユーザーか判別 
  before_action :ensure_correct_user, only: [:show, :edit, :update]
# マイページ
  def show
    @books = current_user.books.all
    favorites = Favorite.where(user_id: @user.id).pluck(:book_id)
    @favo_books = Book.find(favorites)
  end
# ユーザー情報編集機能
  def update
    if @user.update(user_params)
      redirect_to mypage_path(@user)
      flash[:notice] = t('notice.updated')
    else
      flash.now[:alert] = t('notice.not_saved')
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :pasword, :password_confirmation)
  end
#現在のユーザーが自分自身か判別
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to mypage_path(current_user)
    end
  end
end
