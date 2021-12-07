class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @user = User.find(params[:id])
    authorize @user
    @posts = @user.posts.order(created_at: :desc).first(10)
  end

  def batch_invite
  attraction = Attraction.find(params[:attraction_id])
  authorize attraction
  #Validate the user_emails field isn't blank and emails are valid
    params[:user_emails].split(",").each do |email|
      invited_user = User.invite!(email: email)
      attraction_member = AttractionMember.create(user: invited_user, attraction: attraction)
    end
  #redirect_to appropriate path
  redirect_to attraction_path(attraction)
  end
  
end
