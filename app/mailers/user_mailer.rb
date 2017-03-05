class UserMailer < ApplicationMailer
  default from: "vitulasystem@gmail.com"

  def welcome(user)
    @user = user
    mail(:to => @user.email, :subject => "Welcome to Vitula!")
  end

end
