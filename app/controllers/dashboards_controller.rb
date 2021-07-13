class DashboardsController < ApplicationController
  def dashboard
    @dashboard = true
    @attractions = current_user.attractions.includes(:posts)
  end

  def post_stats
    @id = params[:id]
  end
end
