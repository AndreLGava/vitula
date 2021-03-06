class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notification, only: [:destroy, :show_notification]
  before_action :read_notification, only: [:show_notification]


  def index
    @notifications = Notification.where( user_id: current_user.id).order(created_at: :desc).page params[:page]
  end

  def new
    @notification = Notification.new
  end

  def show_notification
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: I18n.t('crud.destroyed') }
    end
  end

  private
    def read_notification
      @notification.update_attributes(read: DateTime.now)
    end

    def set_notification
      @notification = Notification.find(params[:id])
      acesso(@notification.user_id, root_path)
    end

    def notification_params
      params.require(:notification).permit(:title, :description, :read, :limit, :user_id)
    end
end
