require 'faker'

puts "Cleaning DB"
Flat.all.each do |flat|
  flat.photos.purge_later # Removes images from Cloudinary
end

Flat.destroy_all
User.destroy_all

puts "Creating Users"
user1 = User.create!(email: "marco@gmail.com", password: "123456", nickname: "marco")
user2 = User.create!(email: "giorgio@gmail.com", password: "123456", nickname: "giorgio")
user3 = User.create!(email: "alan@gmail.com", password: "123456", nickname: "alan")

puts "Creating Flats"

flat1 = Flat.new(
  name: "The London Maisonette",
  address: "Hoxton, London",
  guests: 4,
  price: 246,
  property_type: "maisonette",
  description: Faker::Lorem.sentence(word_count: 20),
  user: user1
)
file1 = URI.open("https://media.rightmove.co.uk/14k/13096/155524982/13096_EAF110238_L_IMG_00_0000.jpeg")
file2 = URI.open("https://media.rightmove.co.uk/14k/13096/155524982/13096_EAF110238_L_IMG_01_0000.jpeg")
file3 = URI.open("https://media.rightmove.co.uk/14k/13096/155524982/13096_EAF110238_L_IMG_02_0000.jpeg")
file4 = URI.open("https://media.rightmove.co.uk/14k/13096/155524982/13096_EAF110238_L_IMG_06_0000.jpeg")
file5 = URI.open("https://media.rightmove.co.uk/14k/13096/155524982/13096_EAF110238_L_IMG_10_0000.jpeg")
flat1.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat1.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat1.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat1.photos.attach(io: file4, filename: "nes.png", content_type: "image/png")
flat1.photos.attach(io: file5, filename: "nes.png", content_type: "image/png")
flat1.save!
puts "Flat #{Flat.count}"

flat2 = Flat.new(
  name: "Skysreaper view",
  address: "Stratford, London",
  guests: 6,
  price: 440,
  property_type: "flat",
  description: Faker::Lorem.sentence(word_count: 20),
  user: user2
)
file1 = URI.open("https://media.rightmove.co.uk/63k/62080/152041031/62080_UK-S-42432_IMG_10_0000.jpeg")
file2 = URI.open("https://media.rightmove.co.uk/63k/62080/152041031/62080_UK-S-42432_IMG_05_0000.jpeg")
file3 = URI.open("https://media.rightmove.co.uk/63k/62080/152041031/62080_UK-S-42432_IMG_04_0000.jpeg")
file4 = URI.open("https://media.rightmove.co.uk/63k/62080/152041031/62080_UK-S-42432_IMG_00_0000.jpeg")
file5 = URI.open("https://media.rightmove.co.uk/63k/62080/152041031/62080_UK-S-42432_IMG_15_0000.jpeg")
flat2.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat2.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat2.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat2.photos.attach(io: file4, filename: "nes.png", content_type: "image/png")
flat2.photos.attach(io: file5, filename: "nes.png", content_type: "image/png")
flat2.save!
puts "Flat #{Flat.count}"

flat3 = Flat.new(
  name: "Travelodge House",
  address: "Soho, London",
  guests: 8,
  price: 370,
  property_type: "maisonette",
  description: Faker::Lorem.sentence(word_count: 20),
  user: user3
)
file1 = URI.open("https://media.rightmove.co.uk/50k/49602/152084636/49602_MAS210029_IMG_00_0000.jpeg")
file2 = URI.open("https://media.rightmove.co.uk/50k/49602/152084636/49602_MAS210029_IMG_01_0000.jpeg")
file3 = URI.open("https://media.rightmove.co.uk/50k/49602/152084636/49602_MAS210029_IMG_02_0000.jpeg")
file4 = URI.open("https://media.rightmove.co.uk/50k/49602/152084636/49602_MAS210029_IMG_03_0000.jpeg")
file5 = URI.open("https://media.rightmove.co.uk/50k/49602/152084636/49602_MAS210029_IMG_05_0000.jpeg")
flat3.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat3.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat3.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat3.photos.attach(io: file4, filename: "nes.png", content_type: "image/png")
flat3.photos.attach(io: file5, filename: "nes.png", content_type: "image/png")
flat3.save!
puts "Flat #{Flat.count}"

flat4 = Flat.new(
  name: "Palazzo Manfredi",
  address: "Via Labicana, 125, Roma",
  guests: 6,
  price: 570,
  property_type: "rooftop",
  description: Faker::Lorem.sentence(word_count: 20),
  user: user1
)
file1 = URI.open("https://a0.muscache.com/im/pictures/639fed94-fe84-45af-a2cc-a250ba3a4f7e.jpg?im_w=1200&im_format=avif&im_origin=fuzzy")
file2 = URI.open("https://a0.muscache.com/im/pictures/339b9f73-3981-4ae9-ab78-b20b51f37208.jpg?im_w=1440&im_format=avif&im_origin=fuzzy")
file3 = URI.open("https://a0.muscache.com/im/pictures/c5f3a9d5-d684-42fb-a06c-e1197ef08be1.jpg?im_w=1440&im_format=avif&im_origin=fuzzy")
file4 = URI.open("https://a0.muscache.com/im/pictures/53dd922c-9ae6-4bb5-a505-4fe9cab8d5be.jpg?im_w=1440&im_format=avif&im_origin=fuzzy")
file5 = URI.open("https://a0.muscache.com/im/pictures/3faecd19-234e-407f-b89e-bf9a5f29bb2c.jpg?im_w=1440&im_format=avif&im_origin=fuzzy")
flat4.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
flat4.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
flat4.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat4.photos.attach(io: file4, filename: "nes.png", content_type: "image/png")
flat4.photos.attach(io: file5, filename: "nes.png", content_type: "image/png")
flat4.save!
puts "Flat #{Flat.count}"

puts "Created #{Flat.count} flats"
