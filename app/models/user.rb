class User < ApplicationRecord
  has_many :challenges
  has_many :artworks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ACTIVITY = ["Graphic Design", "Digital Sculpture", "Photography", "Video Maker", "Game Artist", "Animator", "Developper", "Musician", "Beatmaker", "Youtuber", "Twitch Streamer", "Influencer"]
  REWARDS = [" + VIP ticket on my next event", " + Goodies", " + Visibility on Social Media", ""]
end
