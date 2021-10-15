class ShortLinksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :show]
  before_action :set_short_link, only: %i[show]

  def new
    @short_link = ShortLink.new
    @attractions = available_attractions
    authorize @short_link
  end

  def show

  end

  def create
    @short_link = ShortLink.new(attraction_params)
    authorize @short_link
    if @short_link.save
      redirect_to short_link_path(@short_link)
    else
      render :new
    end
  end

  private

  def set_short_link
    @short_link = ShortLink.find(params[:id])
    authorize @short_link
  end

  def available_attractions
    if current_user
      current_user.attractions
    else
      [Attraction.first]
    end
  end

  def short_link_params
    params.require(:short_link).permit(:long_url, :attraction)
  end
end
