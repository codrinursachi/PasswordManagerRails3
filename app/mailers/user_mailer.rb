class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.shared_login.subject
  #
  def shared_login
    @sender = params[:sender]
    @receiver = params[:receiver]
    @login = params[:login]
    mail(to: @receiver, subject: "You have been shared a login")
  end
end
