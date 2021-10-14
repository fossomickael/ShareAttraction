class ShortLinksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new]
  def new
    @short_link = ShortLink.new
    authorize @short_link
  end
end
