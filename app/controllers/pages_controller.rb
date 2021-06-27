class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @posts = Post.includes(:user, :attraction)
    @home = true
  end
end
