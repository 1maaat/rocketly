# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

puts "Cleaning database..."

Activity.destroy_all
UserActivity.destroy_all
User.destroy_all
Challenge.destroy_all
Artwork.destroy_all
puts "All record Destroyed"
puts "____________________________"
puts "Creating 10 Users + 1 admin (Rocketly/password)"

User.create!(
  email: "admin@rocketly.cool",
  username: "Rocketly",
  password: "password",
  description: Faker::TvShows::HowIMetYourMother.quote,
  activity_field: Activity::ACTIVITY.sample(rand(1..5)),
  country: "France",
  website_url: "rocketly.cool"
)

10.times do
  user = User.new(
    email: Faker::Internet.unique.email,
    username: Faker::Name.unique.first_name,
    password: "password",
    description: Faker::TvShows::HowIMetYourMother.quote,
    activity_field: Activity::ACTIVITY.sample,
    country: Faker::Address.country,
    website_url: Faker::Internet.domain_name
  )
  user.save!
end

CHALLENGES = ["Create my new Chatroom Emojis", "Create my new Youtube cover", "Design my new Sneakers", "I need a new Logo", "Next Album cover design", "New graphic design for next stream"]

puts "10 Users created!"

puts "Creating 30 Challenges"

30.times do
  Challenge.create!(
    name: CHALLENGES.sample,
    description: Faker::Movies::BackToTheFuture.quote,
    reward: "#{rand(100..10_000)}$" + User::REWARDS.sample,
    start_date: Faker::Date.between(from: 3.days.ago, to: 1.day.from_now),
    end_date: Faker::Date.between(from: 1.day.ago, to: 5.days.from_now),
    status: [0, 1, 2, 3].sample,
    user_id: User.all.sample.id
  )
end
puts "30 Challenges created!"

puts "Creating 100 Artworks"

100.times do
  artwork = Artwork.new(
    title: Faker::JapaneseMedia::Naruto.demon,
    description: Faker::JapaneseMedia::OnePiece.quote,
    selected: false,
    user_id: User.all.sample.id,
    challenge_id: Challenge.all.sample.id,
  )
  artwork.save!
end
puts "100 Artworks created!"

puts "Finished!"
