class Post < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  validates :title, presence: true
end
