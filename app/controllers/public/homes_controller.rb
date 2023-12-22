class Public::HomesController < ApplicationController
  protect_from_forgery
  def top
  end

  def contact
  end

  def email
    redirect_to root_path, notice: "お問い合わせが完了しました。"
  end
end
