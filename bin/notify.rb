#!/usr/bin/env ruby

require "logger"

require_relative "../lib/event_service"
require_relative "../lib/notification_service"

logger = Logger.new(STDOUT)

begin
  logger.info("Fetching events")
  events = EventService.fetch_events
  logger.info("Found #{events.size} event(s)")

  if events.empty?
    logger.info("Skipping notification sending")
  else
    logger.info("Sending notification")
    result = NotificationService.notify_about_events(events)
    logger.info("Notification sent successfully: #{result}")
  end
rescue StandardError => e
  logger.error(e)
end
