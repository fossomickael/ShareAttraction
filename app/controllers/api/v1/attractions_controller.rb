class Api::V1::AttractionsController < ActionController::API
  def one_user
    @user = User.find_by(username: params[:username])
    @attractions = @user.attractions.includes(:posts)
  end
end
