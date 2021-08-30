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
puts "Creating 1 admin (Rocketly/password)"

User.create!(
  email: "admin@rocketly.cool",
  username: "Rocketly",
  password: "password",
  description: Faker::TvShows::HowIMetYourMother.quote,
  country: "France",
  website_url: "rocketly.cool"
)

# Start Jul challenge creation + profile + fans' profiles + artworks
puts "Creating Jul's profile, his sneaker challenge + 3 fans + 6 artworks"

jul = User.create!(
  email: "jul@jul.fr",
  username: "jul",
  password: "password",
  description: "French Rapper looking for fame and super talented fans to make my music even more THEIR music and toujours cabrer en Y la mif",
  country: "Marseille",
  website_url: "jul.cool",
  instagram_url: "https://www.instagram.com/juldetp/?hl=en",
  twitter_url: "https://twitter.com/jul"
)
photo_jul = URI.open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630332367/rocketly_content/OEnHwq0m_400x400_kooadn.jpg")
jul.photo.attach(io: photo_jul, filename: 'profile_jul', content_type: 'image/jpg')

jul_challenge = Challenge.create!(
  name: "👽👟🚀",
  description: "Create the next edition of the Jul's sneakers. The winning pair of sneakers will be produced in very limited editions for luckiest fans.",
  reward: "10 000$",
  start_date: Faker::Date.between(from: 3.days.ago, to: 1.day.from_now),
  end_date: Faker::Date.between(from: 1.day.ago, to: 5.days.from_now),
  status: 1,
  user: jul
)
photo_challenge_jul = URI.open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630329342/rocketly_content/drawing_sneaker_xr8pqc.jpg")
jul_challenge.photo.attach(io: photo_challenge_jul, filename: 'photo_challenge_jul', content_type: 'image/jpg')

fan_1 = User.create!(
  email: "fan1@rocketly.cool",
  username: "Walid",
  password: "password",
  description: Faker::TvShows::HowIMetYourMother.quote,
  country: "Belgium",
  website_url: "jul.cool",
  twitter_url: "https://twitter.com/lightningboltz",
  dribbble_url: "https://dribbble.com/DouglassDesignStudio"
)
photo_fan_1 = URI.open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630327802/rocketly_content/profile_9_qeqanu.jpg")
fan_1.photo.attach(io: photo_fan_1, filename: 'profile_9', content_type: 'image/jpg')

artwork_1 = Artwork.create!(
  title: "Sneaker pour JUL",
  description: "pour mettre en Y sur la mbk",
  selected: false,
  user_id: fan_1.id,
  challenge_id: jul_challenge.id
)
sneaker_1 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630070195/rocketly_content/sneaker1_elz43m.gif')
artwork_1.files.attach(io: sneaker_1, filename: 'sneaker_1', content_type: 'image/gif')

artwork_2 = Artwork.create!(
  title: "JUL checkout these sneakers I made for you",
  description: "dedicated to my favorite rapper of all times",
  selected: false,
  user_id: fan_1.id,
  challenge_id: jul_challenge.id
)
sneaker_2 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630070202/rocketly_content/sneaker2_wcjuvo.gif')
artwork_2.files.attach(io: sneaker_2, filename: 'sneaker_2', content_type: 'image/gif')

fan_2 = User.create!(
  email: "fan2@rocketly.cool",
  username: "Pierre",
  password: "password",
  description: Faker::TvShows::HowIMetYourMother.quote,
  country: "Bahamas",
  website_url: "jul.cool",
  twitter_url: "https://twitter.com/light",
  instagram_url: "https://www.instagram.com/dahotboyz/?hl=en"
)
photo_fan_2 = URI.open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630327803/rocketly_content/profile_3_bzhgn7.jpg")
fan_2.photo.attach(io: photo_fan_2, filename: 'profile_3', content_type: 'image/jpg')

artwork_3 = Artwork.create!(
  title: "Sneakers for my man",
  description: "on l'appelle l'OVNI",
  selected: false,
  user_id: fan_2.id,
  challenge_id: jul_challenge.id
)
sneaker_3 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630070207/rocketly_content/sneaker3_qewqex.gif')
artwork_3.files.attach(io: sneaker_3, filename: 'sneaker_3', content_type: 'image/gif')

artwork_4 = Artwork.create!(
  title: "Mattez-moi ces sneakers",
  description: "I love u JUL ❤️‍🔥",
  selected: false,
  user_id: fan_2.id,
  challenge_id: jul_challenge.id
)
sneaker_4 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630070201/rocketly_content/sneaker4_kc35jd.gif')
artwork_4.files.attach(io: sneaker_4, filename: 'sneaker_2', content_type: 'image/gif')

fan_3 = User.create!(
  email: "fan3@rocketly.cool",
  username: "Tamara",
  password: "password",
  description: Faker::TvShows::HowIMetYourMother.quote,
  country: "South Africa",
  website_url: "jul.cool",
  twitter_url: "https://twitter.com/tamaralt",
  artstation_url: "https://www.artstation.com/lizchief"
)
photo_fan_3 = URI.open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630327802/rocketly_content/profile_2_abnd1e.jpg")
fan_3.photo.attach(io: photo_fan_3, filename: 'profile_2', content_type: 'image/jpg')

artwork_5 = Artwork.create!(
  title: "JUL sneakers Genesis",
  description: "Check this out bro",
  selected: false,
  user_id: fan_3.id,
  challenge_id: jul_challenge.id
)
sneaker_5 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630075702/rocketly_content/ppeqjwa4izomphlzfqj9k6320s0a.gif')
artwork_5.files.attach(io: sneaker_5, filename: 'sneaker_5', content_type: 'image/gif')

artwork_6 = Artwork.create!(
  title: "JUL sneakers Revolution",
  description: "Check this out bro",
  selected: false,
  user_id: fan_3.id,
  challenge_id: jul_challenge.id
)
sneaker_6 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630075737/rocketly_content/i9r5jzv4wcm27xowwma5bk2kzhsq.gif')
artwork_6.files.attach(io: sneaker_6, filename: 'sneaker_6', content_type: 'image/gif')

# End Jul challenge creation + profile + fans' profiles + artworks
# Start Mat challenge creation + profile + fans' profiles + artworks

puts "Creating Mat's profile, his toy challenge + 7 artworks"

mat = User.create!(
  email: "mat@rocketly.cool",
  username: "mat",
  password: "password",
  description: "Hi there 👋, I'm small creator mainly operating on Youtube and Twitch. Here to enhance my fans creativity. Feel free to suggest artworks to the current challenges. Happy to have a chat, just reach out 🍻",
  country: "France 🇫🇷",
  website_url: "mat.pizza",
  twitter_url: "https://twitter.com/1maaaat",
  youtube_url: "randomurl",
  twitter_url: "randomurl"
)
photo_mat = URI.open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630337016/rocketly_content/Capture_d_e%CC%81cran_2021-08-30_a%CC%80_17.23.22_kyxyam.png")
mat.photo.attach(io: photo_mat, filename: 'profile_mat', content_type: 'image/png')

mat_challenge = Challenge.create!(
  name: "🧸🎨🚀",
  description: "I'd like to have a fresh and 3D (mandatory) figurine of myself. Know that I love video games and I have a very high acceptance when it comes to laugh after myself. So please by crazy when it comes to design a toy that I would recreate in 3D if you guys are interested and happy with the final result 🔥",
  reward: "150$",
  start_date: Faker::Date.between(from: 3.days.ago, to: 1.day.from_now),
  end_date: Faker::Date.between(from: 1.day.ago, to: 5.days.from_now),
  status: 1,
  user: mat
)
photo_challenge_mat = URI.open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630336193/rocketly_content/Capture_d_e%CC%81cran_2021-08-30_a%CC%80_17.09.40_kv5xum.png")
mat_challenge.photo.attach(io: photo_challenge_mat, filename: 'photo_challenge_mat', content_type: 'image/png')

mat_artwork_1 = Artwork.create!(
  title: "Mat figurine: first draft",
  description: "I created an artwork which I hope fits with what you exepected! Looking forward to the results 👅",
  selected: false,
  user_id: fan_1.id,
  challenge_id: mat_challenge.id
)
toy_1 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630070249/rocketly_content/1_vx82ih.gif')
mat_artwork_1.files.attach(io: toy_1, filename: 'toy_1', content_type: 'image/gif')

mat_artwork_2 = Artwork.create!(
  title: "Mat's Awesome Toy 👽",
  description: "I know you love Among us, I've created a figurine for you",
  selected: false,
  user_id: fan_1.id,
  challenge_id: mat_challenge.id
)
toy_2 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630070251/rocketly_content/2_xhkoln.gif')
mat_artwork_2.files.attach(io: toy_2, filename: 'toy_2', content_type: 'image/gif')

mat_artwork_3 = Artwork.create!(
  title: "Check dat toy!",
  description: "Directly made for you, tell us what you think about it 🔥🔥🔥",
  selected: false,
  user_id: fan_1.id,
  challenge_id: mat_challenge.id
)
toy_3 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630070253/rocketly_content/3_lzjq3o.gif')
mat_artwork_3.files.attach(io: toy_3, filename: 'toy_2', content_type: 'image/gif')

mat_artwork_4 = Artwork.create!(
  title: "Awesome-o-figurine",
  description: "I loved creating it, hope you'll like it",
  selected: false,
  user_id: fan_2.id,
  challenge_id: mat_challenge.id
)
toy_4 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630340522/rocketly_content/9_tjovzj.gif')
mat_artwork_4.files.attach(io: toy_4, filename: 'toy_4', content_type: 'image/gif')

mat_artwork_5 = Artwork.create!(
  title: "King of the game",
  description: "A tribute to my favourite Streamer",
  selected: false,
  user_id: fan_3.id,
  challenge_id: mat_challenge.id
)
toy_5 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630340526/rocketly_content/7_hgmihu.gif')
mat_artwork_5.files.attach(io: toy_5, filename: 'toy_5', content_type: 'image/gif')

mat_artwork_6 = Artwork.create!(
  title: "Dark Mat Figurine",
  description: "Main Inspiration has been Alien vs Predator",
  selected: false,
  user_id: fan_2.id,
  challenge_id: mat_challenge.id
)
toy_6 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630340532/rocketly_content/8_w3ki5c.gif')
mat_artwork_6.files.attach(io: toy_6, filename: 'toy_6', content_type: 'image/gif')

mat_artwork_7 = Artwork.create!(
  title: "Ninja Mat",
  description: "🥷🥷🥷🥷🥷🥷🥷🥷🥷🥷",
  selected: false,
  user_id: jul.id,
  challenge_id: mat_challenge.id
)
toy_7 = URI.open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630340533/rocketly_content/10_nwvs5q.gif')
mat_artwork_7.files.attach(io: toy_7, filename: 'toy_6', content_type: 'image/gif')


# puts "Creating 10 random users"

# 10.times do
#   user = User.new(
#     email: Faker::Internet.unique.email,
#     username: Faker::Name.unique.first_name,
#     password: "password",
#     description: Faker::TvShows::HowIMetYourMother.quote,
#     country: Faker::Address.country,
#     website_url: Faker::Internet.domain_name
#   )
#   user.save!
# end

# Activity::ACTIVITY.each do |activity|
#   Activity.create!(name: activity)
# end

# 50.times do
#   user_activity = UserActivity.new(
#     user_id: User.all.sample.id,
#     activity_id: Activity.all.sample.id
#   )
#   user_activity.save!
# end

# CHALLENGES = ["Create my new Chatroom Emojis", "Create my new Youtube cover", "Design my new Sneakers", "I need a new Logo", "Next Album cover design", "New graphic design for next stream"]

# puts "10 Users created!"

# puts "Creating 30 random Challenges"

# 30.times do
#   Challenge.create!(
#     name: CHALLENGES.sample,
#     description: Faker::Movies::BackToTheFuture.quote,
#     reward: "#{rand(100..10_000)}$" + User::REWARDS.sample,
#     start_date: Faker::Date.between(from: 3.days.ago, to: 1.day.from_now),
#     end_date: Faker::Date.between(from: 1.day.ago, to: 5.days.from_now),
#     status: [0, 1, 2, 3].sample,
#     user_id: User.all.sample.id
#   )
# end
# puts "30 Challenges created!"

# puts "Creating 100 Artworks"

# 100.times do
#   artwork = Artwork.new(
#     title: Faker::JapaneseMedia::Naruto.demon,
#     description: Faker::JapaneseMedia::OnePiece.quote,
#     selected: false,
#     user_id: User.all.sample.id,
#     challenge_id: Challenge.all.sample.id,
#   )
#   artwork.save!
# end
# puts "100 Artworks created!"

puts "Finished!"
