class NotificationWorker
  include Sidekiq::Worker

  def perform(*args)
    Notification.verify_heat
    Notification.verify_stop
    Notification.verify_parturition
  end
end
