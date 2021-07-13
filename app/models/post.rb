class Post < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  validates :title, presence: true
  after_commit :save_mentions, on: :create

  has_many :post_referrers, dependent: :destroy
  has_many :sharers, through: :post_referrers, class_name: "User", source: :user

  has_rich_text :content
  has_many :mentions

  has_one_attached :photo

  def mentioned?(user)
    mentions.find_by(user_id: user.id).is_a?(Mention)
  end

  def twitter_link
    "https://twitter.com/intent/tweet?text=#{title} by #{user.username}&url=https://shareattraction.com/posts/#{id}"
  end

  def link
    "https://shareattraction.com/posts/#{id}"
  end

  def linkedin_link
    "https://shareattraction.com/posts/#{id}"
  end

 

  private

  def save_mentions
    MentionCreator.new(self).call
  end
end
