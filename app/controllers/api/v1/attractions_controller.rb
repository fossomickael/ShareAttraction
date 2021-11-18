class Api::V1::AttractionsController < ActionController::API
  before_action :authenticate_user!
  after_action :verify_authorized

  include Pundit

  def one_user
    @user = User.find_by(username: params[:username])
    @attractions = @user.attractions.includes(:posts)
    authorize @user
  end

  def mentioned
    @user = User.find_by(username: params[:username])
    @mentioned_posts = @user.mentioned_posts.includes(:attraction)
    authorize @user
  end
end
