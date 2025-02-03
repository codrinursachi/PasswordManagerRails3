# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/shared_login
  def shared_login
    UserMailer.with(sender: "sender@test.com", receiver: "receiver@test.com", login: Login.first).shared_login
  end
end
