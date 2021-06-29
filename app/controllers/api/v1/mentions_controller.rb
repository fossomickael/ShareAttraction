class Api::V1::MentionsController < ActionController::API
  def index
    @users = User.all
  end
end
