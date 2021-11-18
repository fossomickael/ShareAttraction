class Api::V1::MentionsController < ActionController::API
  before_action :authenticate_user!
  def index
    @users = User.all
  end
end
