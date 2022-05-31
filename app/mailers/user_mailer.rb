class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  # include Devise::Controllers::UrlHelpers
  # default template_path: 'users/mailer'

  def welcome
    @user = params[:user]

    mail(to: @user.email, subject: "Welcome to Pirulito's Life, #{@user.first_name}")
  end
end
