class DashboardsController < ApplicationController
  def dashboard
    @dashboard = true
    @attractions = current_user.attractions.includes(:posts)
  end
end
