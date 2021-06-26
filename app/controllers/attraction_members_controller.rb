class AttractionMembersController < ApplicationController
  def new
  end

  def create
    attraction = Attraction.find(params[:attraction_id])
    attraction_member = AttractionMember.new(attraction: attraction, user: current_user)
    attraction_member.save

    redirect_to attraction_path(attraction)
  end
end