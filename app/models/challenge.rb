class Challenge < ApplicationRecord
  belongs_to :user
  has_many :artworks, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :reward, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  enum status: {
    Pending: 0,
    Accepted: 1,
    Declined: 2
  }, _prefix: true
end
