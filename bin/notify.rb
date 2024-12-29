#!/usr/bin/env ruby

require_relative "../lib/event_service"
require_relative "../lib/notification_service"

events = EventService.fetch_events
puts events
NotificationService.notify_about_events(events) if events.size > 0
