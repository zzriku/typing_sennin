class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.notification.subject
  #
  def contact_mail(contact, user)
    @contact = contact
    mail to: user.email, bcc: ENV['ACTION_MAILER_USER'], subject: "お問い合わせについて【自動送信】"
  end
end
