class NotificationsController < ApplicationController
  before_action :set_notification, only: [:destroy]

  def index
    @notifications = Notification.where(user_id: current_user.id)
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @notification, notice: I18n.t('crud.saved') }
        format.json { render :show, status: :created, location: @notification }
      else
        format.html { render :new }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, I18n.t('crud.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:title, :description, :read, :limit, :user_id)
    end
end
