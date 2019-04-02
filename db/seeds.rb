# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create!(username: Faker::FunnyName.name)
end

5.times do 
  Artwork.create!(title: Faker::Lorem.sentence, artist_id: rand(4..10), image_url:Faker::Internet.url)
end

5.times do 
  ArtworkShare.create!(viewer_id: rand(4..10), artwork_id: rand(1..5))
end


