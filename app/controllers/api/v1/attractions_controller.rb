class Api::V1::AttractionsController < ActionController::API
  def one_user
    @user = User.find(params[:id])
    @attractions = @user.attractions.includes(:posts)
  end
end
