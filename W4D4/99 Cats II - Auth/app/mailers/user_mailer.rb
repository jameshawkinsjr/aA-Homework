class UserMailer < ApplicationMailer
    default from: 'everybody@appacademy.io'

    def welcome_email(user)
        @user = user
        @url  = 'http://99cats.com/login'
        mail(to: user.username, subject: 'Welcome to 99 Cats, the cat rental site.')
    end
end
