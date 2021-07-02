class Api::V1::AttractionsController < ActionController::API
  def one_user
    @user = User.find_by(username: params[:username])
    @attractions = @user.attractions.includes(:posts)
  end

  def mentioned
    @user = User.find_by(username: params[:username])
    @mentioned_posts = @user.mentioned_posts.includes(:attraction)
  end
end
