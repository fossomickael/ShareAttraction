class AttractionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save!

    redirect_to attraction_path(@attraction)
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :description)
  end
end
