class NotificationsController < ApplicationController
  before_action :set_notification, only: [:destroy]

  def index
    @notifications = Notification.where(user_id: current_user.id)
  end

  def new
    @notification = Notification.new
  end

  def show
    redirect_to notifications_url
    #render nothing: true

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
      format.html { redirect_to notifications_url, notice: I18n.t('crud.destroyed') }
      format.json { head :no_content }
    end
  end

  def notification_menu
    @notification_menu = Notification.where(read: nil, user_id: current_user.id).last(5)
  end

  private
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:title, :description, :read, :limit, :user_id)
    end
end
