class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_post, only: %i[edit update]

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.includes(:user, :attraction).find(params[:id])
    authorize @post
    ref = params[:ref]
    increment_visit(@post)
    increment_ref(ref, @post)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :content, :published, :attraction_id, :photo)
  end

  def increment_ref(ref, post)
    IncrementRef.new(ref, post).call
  end

  def increment_visit(post)
    if post.visits.nil?
      post.visits = 1
    else
      post.visits += 1
    end
    post.save
  end
end
