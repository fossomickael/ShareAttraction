class DashboardsController < ApplicationController
  def dashboard
    @attractions = current_user.attractions.includes(:posts)
  end
end
