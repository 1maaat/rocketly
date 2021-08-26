class Activity < ApplicationRecord
  has_many :user_activities, dependent: :destroy

  ACTIVITY = ["Graphic Design", "Digital Sculpture", "Photography", "Video Maker", "Game Artist", "Animator",
              "Developper", "Musician", "Beatmaker", "Youtuber", "Twitch Streamer", "Influencer"]
end
