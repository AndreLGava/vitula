class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_filter :set_paper_trail_whodunnit
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :notification_count, if: :user_signed_in?
  before_action :notifications, if: :user_signed_in?
  helper_method :acesso

  def notification_count
    @notification_count = Notification.where(read: nil, user_id: current_user.id).count
  end

  def notifications
    @notification_menu = Notification.where(user_id: current_user.id).order(created_at: :desc).limit(5)
  end

  def acesso(parameter = current_user.id, redirect = root_path)
    if parameter != @current_user.id
      redirect_to redirect, notice: "Acesso não permitido. Você tentou acessar um registro que não está vinculado a sua conta!"
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar, :phone, :born, :cpf, :rg, :address, :city, :language])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :phone, :born, :cpf, :rg, :address, :city, :language])
  end


end
