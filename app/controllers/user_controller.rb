class UserController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_paper_trail_whodunnit

  after_action :send_admin_mail

  def send_admin_mail
    UserMailer.welcome(self).deliver
  end
end
