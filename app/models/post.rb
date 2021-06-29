class Post < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  validates :title, presence: true
  after_commit :save_mentions, on: :create

  has_many :post_referrers, dependent: :destroy

  has_rich_text :content
  has_many :mentions

  def mentioned?(user)
    mentions.find_by(user_id: user.id).is_a?(Mention)
  end

  private

  def save_mentions
    MentionCreator.new(self).call
  end
end
