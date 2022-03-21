class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:show, :edit, :update]

  def show
    #@user = User.find(params[:id])
    @books = current_user.books.all
    favorites = Favorite.where(user_id: @user.id).pluck(:book_id)
    @favo_books = Book.find(favorites)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_path(@user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :pasword, :password_confirmation)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to mypage_path(current_user)
    end
  end
end
