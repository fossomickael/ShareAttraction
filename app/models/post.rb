class Post < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  has_one :short_link_post, dependent: :destroy
  has_one :short_link, through: :short_link_post, dependent: :destroy
  validates :title, presence: true
  after_commit :save_mentions, on: :create
  after_create :create_short_link

  has_many :post_referrers, dependent: :destroy
  has_many :sharers, through: :post_referrers, class_name: "User", source: :user

  has_rich_text :content
  has_many :mentions

  has_one_attached :photo

  def mentioned?(user)
    mentions.find_by(user_id: user.id).is_a?(Mention)
  end

  def twitter_link
    p = URI::Parser.new
    p.escape("https://twitter.com/intent/tweet?text=#{title} by #{user.username}&url=https://shareattraction.com/#{id}")
  end

  def link
    "https://shareattraction.com/#{id}"
  end

  def linkedin_link
    "https://shareattraction.com/#{id}"
  end

 

  private

  def save_mentions
    MentionCreator.new(self).call
  end

  def create_short_link
    CreatePostLink.new(self).call
  end
end
