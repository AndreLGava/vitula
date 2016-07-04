class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_filter :set_paper_trail_whodunnit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :notification_count, if: :user_signed_in?
  before_action :notifications, if: :user_signed_in?

  def notification_count
    @notification_count = Notification.where(read: nil, user_id: current_user.id).count
  end

  def notifications
    @notification_menu = Notification.where(user_id: current_user.id).order(created_at: :desc).first(5)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :phone, :born, :cpf, :rg, :address, :city, :language])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :phone, :born, :cpf, :rg, :address, :city, :language])
  end
end
