class RetrieveUserSlackId
  def initialize(user)
    @user = user
  end

  def call
    res = launch_request
    json = JSON.parse(res.body)
    if res.is_a?(Net::HTTPSuccess) && json["ok"]
      slack_user_id = json["user"]["id"]
      add_slack_id_to_user(slack_user_id)
      return true
    else
      res.value
      return false
    end
  end

  private

  def launch_request
    uri = URI("https://slack.com/api/users.lookupByEmail?email=#{@user.email}")
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = ENV['SLACK_APP_TOKEN']
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http|
      http.request(req)
    }
    return res
  end

  def add_slack_id_to_user(slack_user_id)
    @user.slack_id = slack_user_id
    @user.save
  end
end
