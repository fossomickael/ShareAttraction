class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save!

    redirect_to post_path(@post)
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :published, :attraction_id)
  end
end
