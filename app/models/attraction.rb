class Attraction < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true

  has_many :posts
  has_many :attraction_members, dependent: :destroy
  has_many :users, through: :attraction_members

  validates_format_of :name, with: /\A[a-z]+\z/, message: "only downcase letters"
end
