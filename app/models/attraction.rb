class Attraction < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true

  has_many :posts
  has_many :attraction_members, dependent: :destroy
  has_many :users, through: :attraction_members
end
