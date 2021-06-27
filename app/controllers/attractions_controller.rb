class AttractionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def new
    @attraction = Attraction.new
  end

  def index
    @attractions = Attraction.all
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def show
    @attraction = Attraction.includes(:users,:posts).find(params[:id])
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :description)
  end
end
