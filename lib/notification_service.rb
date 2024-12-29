module NotificationService
  require_relative "notification_service/client"

  def self.notify_about_events(events)
    Client.new.notify_about_events(events)
  end
end
