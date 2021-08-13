class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @user = User.find(params[:id])
    authorize @user
    @posts = @user.posts.order(created_at: :desc).first(10)
  end
end
