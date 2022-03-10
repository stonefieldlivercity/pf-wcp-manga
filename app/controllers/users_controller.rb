class UsersController < ApplicationController
  before_action :authenticate_user!
  #before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  #def edit
  #end

  #def update
    #if @user.update(user_params)
      #redirect_to mypage_path(@user)
    #else
      #render "edit"
    #end
  #end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
