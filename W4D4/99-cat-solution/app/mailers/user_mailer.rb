class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'localhost'
    mail(to: user, subject: "Thanks for following! See you on the other side!")
  end
end
