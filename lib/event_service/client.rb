require "httparty"
require "json"
require "tzinfo"

module EventService
  class Client
    def fetch_events
      token = get_token
      event_url = "#{base_url}/includes/rest_v2/plugins_events_events_by_date/find/?json=#{event_query}&token=#{token}"
      json = HTTParty.get(event_url).parsed_response
      json["docs"]
    end

    private

    def get_token
      token_url = "#{base_url}/plugins/core/get_simple_token/"
      response = HTTParty.get(token_url)
      response.body
    end

    def event_query
      {
        filter: {
          active: true,
          calendarid: { "$in" => ["ticketmaster", "1", "etix", "axs"] },
          date_range: {
            start: { "$date" => beginning_of_day_utc_iso8601 },
            end: { "$date" => beginning_of_day_utc_iso8601 }
          }
        },
        options: {
          limit: 5,
          skip: 0,
          castDocs: false,
          fields: {
            startTime: 1,
            startDate: 1,
            title: 1
          },
          sort: {
            date: 1,
            startTime: 1,
            rank: 1,
            title_sort: 1
          }
        }
      }.to_json
    end

    def beginning_of_day_utc_iso8601
      now_eastern = TZInfo::Timezone.get("America/New_York").now
      midnight_eastern = Time.new(now_eastern.year, now_eastern.month, now_eastern.day, 0, 0, 0, now_eastern.utc_offset)
      midnight_eastern.utc.strftime("%Y-%m-%dT%H:%M:%S.000Z")
    end

    def base_url
      "https://fisherseventcenter.com"
    end
  end
end
