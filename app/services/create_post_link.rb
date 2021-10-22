class CreatePostLink
  def initialize(post)
    @post = post
  end

  def call
    long_url = "https://shareattraction.com/posts/#{@post.id}"
    short_link = ShortLink.create(user: @post.user, attraction: @post.attraction, description: @post.title, long_url: long_url)
    ShortLinkPost.create(post: @post, short_link: short_link)
  end
end
