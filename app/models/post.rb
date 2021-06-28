class Post < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  validates :title, presence: true

  has_many :post_referrers, dependent: :destroy

  has_rich_text :content
end
