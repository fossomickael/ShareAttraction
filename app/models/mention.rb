class Mention < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :post, uniqueness: { scope: :user }
  validates :post, presence: true
  validates :user, presence: true
end
