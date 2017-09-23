class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = 'http://petrablog.ru'
    mail(to: @user, subject: 'Добро пожаловать на наш сайт!')
  end
end
