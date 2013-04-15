class Event
  MEETUP_API_KEY = File.read(File.join(App.resources_path, 'meetup_api_key'))

  def self.all(&blk)
    url = "https://api.meetup.com/2/events?key=#{MEETUP_API_KEY}&sign=true&group_urlname=bergenrb&status=upcoming,past"
    BW::HTTP.get(url) do |response|
      NSLog('Finished async loading events')
      parsed_response = BW::JSON.parse(response.body.to_s)
      events = parsed_response['results'].map { |c| new(name: c['name']) }.reverse
      blk.call(events)
    end
  end

  attr_reader :name

  def initialize(params={})
    @name = params[:name]
  end
end
