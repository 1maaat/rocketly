class Challenge < ApplicationRecord
  belongs_to :user
  has_many :artworks, dependent: :destroy
  has_one_attached :photo

  STATUS = ["draft", "in progress", "vote", "ended"]

  validates :name, presence: true
  validates :description, presence: true
  validates :reward, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  enum status: {
    draft: 0,
    in_progress: 1,
    vote: 2,
    ended: 3
  }, _prefix: true
end
