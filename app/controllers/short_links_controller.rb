class ShortLinksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show, :redirection]
  before_action :set_short_link, only: %i[show]

  def new
    @short_link = ShortLink.new
    @attractions = available_attractions
    authorize @short_link
  end

  def show
    authorize @short_link
  end

  def create
    @short_link = ShortLink.new(short_link_params)
    authorize @short_link
    @short_link.user = current_user if current_user
    if @short_link.save!
      redirect_to short_link_path(@short_link)
    else
      render :new
    end
  end

  def redirection
    short = params[:short]
    id = ShortLink.bijective_decode(short)
    short_link = ShortLink.find(id)
    short_link.clicks.nil? ? short_link.clicks = 1 : short_link.clicks += 1
    short_link.save
    authorize short_link
    ref = params[:ref]
    referrer = User.where(referrer_code: ref).take
    link_referrer = ShortLinkReferrer.where(user: referrer, short_link: short_link).take
    if link_referrer
      link_referrer.count += 1
      link_referrer.save!
    else
      new_referrer = ShortLinkReferrer.new(user: referrer, short_link: short_link, count: 1)
      new_referrer.save!
    end
    url = short_link.long_url
    redirect_to url
  end

  private

  def set_short_link
    @short_link = ShortLink.find(params[:id])
    authorize @short_link
  end

  def available_attractions
    current_user&.attractions
  end

  def short_link_params
    params.require(:short_link).permit(:long_url, :attraction_id, :description)
  end
end
