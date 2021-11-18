class Api::V1::PostsController < ActionController::API
  before_action :authenticate_user!

  before_action :authenticate_user!
  after_action :verify_authorized

  include Pundit
  def referrers
    @post = Post.find(params[:id])
    @referrers = @post.post_referrers
    authorize @post
  end
end
