class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attraction_members, dependent: :destroy
  has_many :attractions, through: :attraction_members

  has_many :posts, dependent: :destroy
  has_many :post_referrers, dependent: :destroy

  has_many :mentions
  has_many :mentioned_posts, through: :mentions, source: :post

  has_many :short_links, dependent: :destroy

  after_create :set_referrer_code

  validates :username, presence: true
  validates :username, format: { without: /\s/, message: "must contain no spaces" }
  validates :username, uniqueness: true

  validates :email, uniqueness: true

  def ismember?(attraction)
    !attractions.where(id: attraction.id).empty?
  end

  

  private

  def set_referrer_code
    code = "#{id}-#{SecureRandom.hex(3)}"
    self.referrer_code = code
    save
  end
end
