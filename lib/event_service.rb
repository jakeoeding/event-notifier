module EventService
  require_relative 'event_service/client'

  def self.fetch_events
    client = Client.new
  end
end