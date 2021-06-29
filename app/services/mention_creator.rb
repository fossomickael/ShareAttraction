class MentionCreator
  def initialize(post)
    @post = post
  end

  def call
    save_mentions(@post)
  end

  private

  def save_mentions(post)
    all_mentionned_users(post.content.to_plain_text).each do |username|
      user = find_user(username)
      Mention.create(user: user, post: post)
    end
  end

  def find_user(username)
    User.find_by(username: username)
  end

  def all_mentionned_users(post)
    post.scan(/@(\w+)/)
  end
end
