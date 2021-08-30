class User < ApplicationRecord
  REWARDS = [" + VIP ticket on my next event", " + Goodies", " + Visibility on Social Media", ""]
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :challenges, dependent: :destroy
  has_many :artworks, dependent: :destroy
  has_many :user_activities, dependent: :destroy
  has_many :activities, through: :user_activities

  def avatar_if_present
    return "https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630073580/rocketly_content/avatar_b9iusa.png" unless photo.attached?

    photo.key
  end

  def password_required?
    if respond_to?(:reset_password_token)
      return true if reset_password_token.present?
    end
    return true if new_record?
    password.present? || password_confirmation.present?
  end
end
