class UserMailer < ApplicationMailer
    default from: 'eli.kantor@outlook.com'

    # def welcome_email
    #     @user = params[:user]
    #     @url  = 'http://localhost:3000/'
    #     mail(to: @user.email, subject: "Welcome to Flatiron's Survey App")
    # end

    def welcome_email(user)
        @user = user
        @url  = 'https://survey-genie-frontend.herokuapp.com/'
        mail(to: @user.email, subject: "Welcome to Survey Genie")
    end
    
end
