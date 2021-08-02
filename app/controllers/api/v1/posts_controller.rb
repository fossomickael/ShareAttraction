class Api::V1::PostsController < ActionController::API
  def referrers
    @post = Post.find(params[:id])
    @referrers = PostReferrer.includes(:user).where(post_id: params[:id]) 
  end
end
