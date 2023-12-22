# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    if params[:user]
      reject_inactive_user
      return if performed?
    end
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    redirect_to after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  #ゲストログイン機能
  def guest_sign_in
    user = User.guest
    sign_in user
    flash[:notice] = "ゲストでログインしました。"
    redirect_to root_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_registration_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  #退会後のログインを阻止
  def reject_inactive_user
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.valid_password?(params[:user][:password]) && !@user.is_active
      redirect_to new_user_session_path, alert: 'アカウントは凍結されています。お問い合わせに連絡してください。'
    end
  end
end