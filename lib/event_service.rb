module EventService
  require_relative 'event_service/client'

  def self.fetch_events
    Client.new.fetch_events
  end
end
