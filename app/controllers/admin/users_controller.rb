class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.latest
  end

  def show
  end

  def update
    @user.update(user_params)
    redirect_to request.referer, notice: 'ユーザー情報が更新されました。'
  end

  def withdraw
    @user = User.find(params[:id])
    #return if @user.guest?
    @user.update(is_active: !@user.is_active)
    redirect_to admin_users_path, notice: 'ユーザーのステータスを変更しました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:status)
  end
end