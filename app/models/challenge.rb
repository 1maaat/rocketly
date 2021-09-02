require 'date'

class Challenge < ApplicationRecord
  belongs_to :user
  has_many :artworks, dependent: :destroy
  has_one_attached :photo

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
  }

  after_create_commit :set_status

  def set_status
    if start_date <= Date.today && end_date > Date.today
      in_progress!
    elsif start_date < Date.today && end_date == Date.today
      vote!
    else
      draft!
    end
  end
end
