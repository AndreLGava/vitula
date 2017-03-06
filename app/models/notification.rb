class Notification < ActiveRecord::Base
  belongs_to :user

  has_paper_trail

  def self.create(notification_params)
    @notification = Notification.new(notification_params)
    @notification.save
  end
  
end
