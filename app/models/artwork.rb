class Artwork < ApplicationRecord
  has_many_attached :files
  belongs_to :challenge
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :files, presence: true
end
