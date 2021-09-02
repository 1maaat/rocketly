# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
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


def safe_open(url, array)
  URI.open(url)
rescue # put a specific error class here ideally
  array << url
  URI.open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572724/rocketly_seed/OEnHwq0m_400x400_b7siig.jpg")
end

unloaded_urls = []

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
photo_jul = safe_open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572724/rocketly_seed/OEnHwq0m_400x400_b7siig.jpg", unloaded_urls)
jul.photo.attach(io: photo_jul, filename: 'profile_jul', content_type: 'image/jpg')

jul_challenge = Challenge.create!(
  name: "👽👟🚀 - Design my new sneakers",
  description: "Create the next edition of the Jul's sneakers. The winning pair of sneakers will be produced in very limited editions for luckiest fans.",
  reward: "10 000$",
  start_date: Faker::Date.between(from: 3.days.ago, to: Date.today),
  end_date: Faker::Date.between(from: 2.days.from_now, to: 6.days.from_now),
  status: 1,
  user: jul
)
photo_challenge_jul = safe_open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630573050/rocketly_seed/challenge_sneaker_wgtrfr.jpg", unloaded_urls)
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
photo_fan_1 = safe_open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572212/rocketly_seed/profile_1_bcp0za.jpg", unloaded_urls)
fan_1.photo.attach(io: photo_fan_1, filename: 'profile_9', content_type: 'image/jpg')

artwork_1 = Artwork.create!(
  title: "Sneaker pour JUL",
  description: "put en Y sur la mbk",
  selected: false,
  user_id: fan_1.id,
  challenge_id: jul_challenge.id
)
sneaker_1 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572831/rocketly_seed/sneaker1_jkpsgo.gif', unloaded_urls)
artwork_1.files.attach(io: sneaker_1, filename: 'sneaker_1', content_type: 'image/gif')

fan_1_b = User.create!(
  email: "fan1b@rocketly.cool",
  username: "Emily",
  password: "password",
  description: Faker::TvShows::HowIMetYourMother.quote,
  country: "Danemark",
  website_url: "jul.cool",
  twitter_url: "https://twitter.com/lightningboltz",
  dribbble_url: "https://dribbble.com/DouglassDesignStudio"
)
photo_fan_1_b = safe_open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572213/rocketly_seed/profile_2_h3dlws.jpg", unloaded_urls)
fan_1_b.photo.attach(io: photo_fan_1_b, filename: 'profile_9', content_type: 'image/jpg')

artwork_2 = Artwork.create!(
  title: "JUL checkout these sneakers I made for you",
  description: "dedicated to my favorite rapper of all times",
  selected: false,
  user_id: fan_1_b.id,
  challenge_id: jul_challenge.id
)
sneaker_2 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572837/rocketly_seed/sneaker2_tcl0hd.gif', unloaded_urls)
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
photo_fan_2 = safe_open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572214/rocketly_seed/profile_3_yzzyx1.jpg", unloaded_urls)
fan_2.photo.attach(io: photo_fan_2, filename: 'profile_3', content_type: 'image/jpg')

artwork_3 = Artwork.create!(
  title: "Sneakers for my man",
  description: "call him l'OVNI",
  selected: false,
  user_id: fan_2.id,
  challenge_id: jul_challenge.id
)
sneaker_3 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572848/rocketly_seed/sneaker3_hpxa44.gif', unloaded_urls)
artwork_3.files.attach(io: sneaker_3, filename: 'sneaker_3', content_type: 'image/gif')

fan_2_b = User.create!(
  email: "fan2b@rocketly.cool",
  username: "Richard",
  password: "password",
  description: Faker::TvShows::HowIMetYourMother.quote,
  country: "Italia",
  website_url: "jul.cool",
  twitter_url: "https://twitter.com/light",
  instagram_url: "https://www.instagram.com/dahotboyz/?hl=en"
)
photo_fan_2_b = safe_open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572212/rocketly_seed/profile_4_zge63j.jpg", unloaded_urls)
fan_2_b.photo.attach(io: photo_fan_2_b, filename: 'profile_3', content_type: 'image/jpg')

artwork_4 = Artwork.create!(
  title: "These ones are the winning ones 👑",
  description: "I love u JUL ❤️‍🔥",
  selected: false,
  user_id: fan_2_b.id,
  challenge_id: jul_challenge.id
)
sneaker_4 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572831/rocketly_seed/sneaker4_u9panr.gif', unloaded_urls)
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
photo_fan_3 = safe_open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572212/rocketly_seed/profile_5_wlgflx.jpg", unloaded_urls)
fan_3.photo.attach(io: photo_fan_3, filename: 'profile_2', content_type: 'image/jpg')

artwork_5 = Artwork.create!(
  title: "JUL sneakers Genesis",
  description: "Check this out bro",
  selected: false,
  user_id: fan_3.id,
  challenge_id: jul_challenge.id
)
sneaker_5 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572839/rocketly_seed/sneaker5_m46xvn.gif', unloaded_urls)
artwork_5.files.attach(io: sneaker_5, filename: 'sneaker_5', content_type: 'image/gif')

fan_3_b = User.create!(
  email: "fan3b@rocketly.cool",
  username: "Julia",
  password: "password",
  description: Faker::TvShows::HowIMetYourMother.quote,
  country: "Guatemala",
  website_url: "jul.cool",
  twitter_url: "https://twitter.com/light",
  instagram_url: "https://www.instagram.com/dahotboyz/?hl=en"
)
photo_fan_3_b = safe_open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572214/rocketly_seed/profile_6_wimio4.jpg", unloaded_urls)
fan_3_b.photo.attach(io: photo_fan_3_b, filename: 'profile_3', content_type: 'image/jpg')

artwork_6 = Artwork.create!(
  title: "JUL sneakers Revolution",
  description: "Check this out bro",
  selected: false,
  user_id: fan_3_b.id,
  challenge_id: jul_challenge.id
)
sneaker_6 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572834/rocketly_seed/sneaker6_uxvqtj.gif', unloaded_urls)
artwork_6.files.attach(io: sneaker_6, filename: 'sneaker_6', content_type: 'image/gif')

puts "Created!"

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
  youtube_url: "randomurl"
)
photo_mat = safe_open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572991/rocketly_seed/mat_profile_2_tvvzpv.jpg", unloaded_urls)
mat.photo.attach(io: photo_mat, filename: 'profile_mat', content_type: 'image/jpg')

mat_challenge = Challenge.create!(
  name: "🧸🎨🚀 - Create a funny 3D version of myself",
  description: "I'd like to have a fresh and 3D (mandatory) figurine of myself. Know that I love video games and I have a very high acceptance when it comes to laugh after myself. So please by crazy when it comes to design a toy that I would recreate in 3D if you guys are interested and happy with the final result 🔥",
  reward: "150$",
  start_date: Faker::Date.between(from: 3.days.ago, to: 5.days.ago),
  end_date: Date.today,
  status: 2,
  user: mat
)
photo_challenge_mat = safe_open("https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630573134/rocketly_seed/challenge_toy_lq3boq.png", unloaded_urls)
mat_challenge.photo.attach(io: photo_challenge_mat, filename: 'photo_challenge_mat', content_type: 'image/png')

mat_artwork_1 = Artwork.create!(
  title: "Mat figurine: first draft",
  description: "I created an artwork which I hope fits with what you exepected! Looking forward to the results 👅",
  selected: false,
  user_id: fan_1.id,
  challenge_id: mat_challenge.id
)
toy_1 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572785/rocketly_seed/1_kf0ngm.gif', unloaded_urls)
mat_artwork_1.files.attach(io: toy_1, filename: 'toy_1', content_type: 'image/gif')

mat_artwork_2 = Artwork.create!(
  title: "Mat's Awesome Toy 👽",
  description: "I know you love Among us, I've created a figurine for you",
  selected: false,
  user_id: fan_1_b.id,
  challenge_id: mat_challenge.id
)
toy_2 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572784/rocketly_seed/7_s5evhn.gif', unloaded_urls)
mat_artwork_2.files.attach(io: toy_2, filename: 'toy_2', content_type: 'image/gif')

mat_artwork_3 = Artwork.create!(
  title: "Check dat toy!",
  description: "Directly made for you, tell us what you think about it 🔥🔥🔥",
  selected: false,
  user_id: fan_3_b.id,
  challenge_id: mat_challenge.id
)
toy_3 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572802/rocketly_seed/8_xnzygg.gif', unloaded_urls)
mat_artwork_3.files.attach(io: toy_3, filename: 'toy_2', content_type: 'image/gif')

mat_artwork_4 = Artwork.create!(
  title: "Awesome-o-figurine",
  description: "I loved creating it, hope you'll like it",
  selected: false,
  user_id: fan_2.id,
  challenge_id: mat_challenge.id
)
toy_4 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572782/rocketly_seed/9_raas4g.gif', unloaded_urls)
mat_artwork_4.files.attach(io: toy_4, filename: 'toy_4', content_type: 'image/gif')

mat_artwork_5 = Artwork.create!(
  title: "King of the game",
  description: "A tribute to my favourite Streamer",
  selected: false,
  user_id: fan_3.id,
  challenge_id: mat_challenge.id
)
toy_5 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572790/rocketly_seed/3_cpm7d7.gif', unloaded_urls)
mat_artwork_5.files.attach(io: toy_5, filename: 'toy_5', content_type: 'image/gif')

mat_artwork_6 = Artwork.create!(
  title: "Dark Mat Figurine",
  description: "Main Inspiration has been Alien vs Predator",
  selected: false,
  user_id: fan_2_b.id,
  challenge_id: mat_challenge.id
)
toy_6 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572791/rocketly_seed/4_z8dyzx.gif', unloaded_urls)
mat_artwork_6.files.attach(io: toy_6, filename: 'toy_6', content_type: 'image/gif')

mat_artwork_7 = Artwork.create!(
  title: "Ninja Mat",
  description: "🥷🥷🥷🥷🥷🥷🥷🥷🥷🥷",
  selected: false,
  user_id: jul.id,
  challenge_id: mat_challenge.id
)
toy_7 = safe_open('https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572801/rocketly_seed/10_ffwo5j.gif', unloaded_urls)
mat_artwork_7.files.attach(io: toy_7, filename: 'toy_6', content_type: 'image/gif')

puts "Created!"

puts "Creating 6 random Challenges"

CHALLENGES_NAME = [" 🧩⚡️👽 - Create a fake boardgame", " 🍿🎞🖥 - Create my new Youtube cover", "👾👑🏆 - Create my new Twitch emotes", "🖼⚜️💟 - Redesign my streaming setup", "💿〽️🎧 - Design my next album cover", "🕹🦸‍♂️💎 - Create my Fortnite skin"]
PHOTOS_CHALLENGES = ['https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572972/rocketly_seed/challenge_boardgame_ewltsb.jpg',
'https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630573024/rocketly_seed/challenge_youtube_cqfxop.png',
'https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572923/rocketly_seed/challenge_twitch_asbf4c.jpg',
'https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630574742/rocketly_seed/challenge_setup_weoknl.jpg',
'https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572931/rocketly_seed/challenge_album_kqkbz7.jpg',
'https://res.cloudinary.com/dnh5m7rqh/image/upload/v1630572961/rocketly_seed/challenge_skin_fortinite_ntyx5p.jpg']

6.times do |index|
  challenge = Challenge.create!(
    name: CHALLENGES_NAME[index],
    description: Faker::Movies::BackToTheFuture.quote,
    reward: "#{rand(100..10_000)}$",
    start_date: Faker::Date.between(from: 3.days.ago, to: Date.today),
    end_date: Faker::Date.between(from: 2.days.from_now, to: 5.days.from_now),
    user_id: User.all.sample.id
  )
  photo_ch = safe_open(PHOTOS_CHALLENGES[index], unloaded_urls)
  challenge.photo.attach(io: photo_ch, filename: challenge.name, content_type: 'image/jpg')
  challenge.save!
end

puts "6 Challenges created!"

#No need to create artworks for the demo = we'll only show 2 pre-made challenges but we need to populate the challenge#index with many original challenges

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
puts "😱 #{unloaded_urls}"
