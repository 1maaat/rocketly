class Challenge < ApplicationRecord
  belongs_to :user
  has_many :artworks, dependent: :destroy

  enum status: {
    draft: 0,
    in_progress: 1,
    vote: 2,
    ended: 3
  }, _prefix: true
end
