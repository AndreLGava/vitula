class UserController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_paper_trail_whodunnit
  
  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.send_new_user_message(self).deliver
  end
end
