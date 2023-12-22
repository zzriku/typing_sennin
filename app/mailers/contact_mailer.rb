class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.notification.subject
  #
  def notification(args)
    email = args[:email]
    @url = 'http://localhost:8000/orders'
    mail(to: email, subject: 'お問い合わせが完了しました。')
  end
end
