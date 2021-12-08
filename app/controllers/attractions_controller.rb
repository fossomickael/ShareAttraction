class AttractionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def new
    @attraction = Attraction.new
    authorize @attraction
  end

  def index
    policy_scope(Attraction)
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.new(attraction_params)
    authorize @attraction
    if @attraction.save
      AttractionMember.create(attraction: @attraction, user: current_user)
      redirect_to attraction_invite_path(@attraction)
    else
      render :new
    end
  end

  def show
    @attraction = Attraction.includes(:users,:posts).find(params[:id])
    authorize @attraction
  end

  def invite
    authorize Attraction.find(params[:attraction_id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :description)
  end
end
