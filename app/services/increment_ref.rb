class IncrementRef
  def initialize(ref, post)
    @post = post
    @ref = ref
  end

  def call
    increment(@post, @ref)
  end

  private

  def increment(post, ref)
    referrer = User.where(referrer_code: ref).take
    return unless referrer

    post_referrer = PostReferrer.where(user: referrer, post: post).take
    if post_referrer
      post_referrer.count += 1
      post_referrer.save
    else
      new_ref(referrer, post)
    end
  end

  def new_ref(referrer, post)
    new_referrer = PostReferrer.new(user: referrer, post: post, count: 1)
    new_referrer.save
  end
end
