class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.includes(:user, :attraction).find(params[:id])
    ref = params[:ref]
    increment_ref(ref, @post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :published, :attraction_id)
  end

  def increment_ref(ref, post)
    referrer = User.where(referrer_code: ref).take
    return unless referrer

    post_referrer = PostReferrer.where(user: referrer, post: post).take
    if post_referrer
      post_referrer.count += 1
      post_referrer.save
    else
      new_referrer = PostReferrer.new(user: referrer, post: post, count: 1)
      new_referrer.save
    end
  end
end
