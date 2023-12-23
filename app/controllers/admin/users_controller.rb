class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.latest
  end

  def show
    @user = User.find(params[:id])
  end

  #退会アクション
  def withdraw
    @user = User.find(params[:id])
    #return if @user.guest?
    @user.update(is_active: !@user.is_active)
    redirect_to admin_users_path, notice: 'ユーザーのステータスを変更しました。'
  end

  #画像変更アクション
  def edit
    @user = User.find(params[:id])
  end

  #画像更新アクション
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:status)
  end
end