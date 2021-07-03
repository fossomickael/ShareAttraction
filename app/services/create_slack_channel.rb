class CreateSlackChannel
  def initialize(attraction)
    @attraction = attraction
    @attraction_name = attraction.name.downcase
  end

  def call
    res = launch_request
    case res
    when Net::HTTPSuccess, Net::HTTPRedirection
      # OK
      json = JSON.parse(res.body)
      create_slack_channel_in_db(json)
      return true
    else
      res.value
      return false
    end
  end

  private

  def launch_request
    uri = URI('https://slack.com/api/conversations.create')
    req = Net::HTTP::Post.new(uri)
    req.set_form_data('name' => @attraction_name)
    req['Authorization'] = ENV['SLACK_APP_TOKEN']
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(req)
    end
    return res
  end

  def create_slack_channel_in_db(json)
    channel_id = json["channel"]["id"]
    SlackChannel.create!(slack_id: channel_id, attraction: @attraction)
  end
end
