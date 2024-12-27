#!/usr/bin/env ruby

require_relative "../lib/event_service"

events = EventService.fetch_events
puts events
