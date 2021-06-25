class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :attraction_members
  has_many :attractions, through: :attraction_members

  has_many :posts

  def ismember?(attraction)
    !attractions.where(id: attraction.id).empty?
  end
end
