class Post < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  validates :title, presence: true
  after_commit :save_mentions, on: :create

  has_many :post_referrers, dependent: :destroy

  has_rich_text :content

  private

  def save_mentions
    MentionCreator.new(self).call
  end
end
