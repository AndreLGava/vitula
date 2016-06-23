class UserController < ApplicationController
  before_filter :authenticate_user!

  def send_admin_mail
    UserMailer.send_new_user_message(self).deliver
  end
end
