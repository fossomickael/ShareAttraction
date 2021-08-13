class DashboardsController < ApplicationController
  def dashboard
    authorize :dashboard
    @dashboard = true
    @attractions = current_user.attractions.includes(:posts)
  end

  def post_stats
    @post = Post.find(params[:id])
    authorize @post
    @id = params[:id]
  end
end
