class User < ApplicationRecord
  has_many :challenges, dependent: :destroy
  has_many :artworks, dependent: :destroy
  has_many :user_activities, dependent: :destroy
  has_many :activities, through: :user_activities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  REWARDS = [" + VIP ticket on my next event", " + Goodies", " + Visibility on Social Media", ""]
end
