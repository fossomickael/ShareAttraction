class DashboardsController < ApplicationController
  def dashboard
    @attractions = current_user.attractions
  end
end
