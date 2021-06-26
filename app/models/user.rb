class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attraction_members
  has_many :attractions, through: :attraction_members

  has_many :posts

  after_validation :set_referrer_code
  def ismember?(attraction)
    !attractions.where(id: attraction.id).empty?
  end

  private

  def set_referrer_code
    code = "#{id} #{SecureRandom.hex(5)}"
    self.referrer_code = code
  end
end
