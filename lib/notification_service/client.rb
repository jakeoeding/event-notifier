require "httparty"
require "time"

module NotificationService
  class Client
    def notify_about_events(events)
      response = HTTParty.post(pushover_api_url, body: {
        token: ENV["PUSHOVER_API_TOKEN"],
        user: ENV["PUSHOVER_USER_KEY"],
        message: build_message(events)
      })
      response.code == 200
    end

    private

    def build_message(events)
      events_message = events.map { |event| format_message(event) }.join("\n")

      "Today's event(s):\n#{events_message}"
    end

    def format_message(event)
      "#{event["title"]} at #{convert_to_12_hour_time(event["startTime"])}"
    end

    def convert_to_12_hour_time(time)
      Time.parse(time).strftime("%I:%M %p")
    end

    def pushover_api_url
      "https://api.pushover.net/1/messages.json"
    end
  end
end
