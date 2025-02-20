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

# flat2 = Flat.new(
#   name: "Skysreaper view",
#   address: "Stratford, London",
#   guests: 6,
#   price: 440,
#   property_type: "flat",
#   description: Faker::Lorem.sentence(word_count: 20),
#   user: user2
# )
# file = URI.open("https://images.unsplash.com/photo-1619460485417-82881a4c984d?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
# # file2 = URI.open("https://images.unsplash.com/photo-1613775967978-d07fb817ce9a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
# # file3 = URI.open("https://images.unsplash.com/photo-1640872162491-776671bd7d79?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
# flat2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# # flat2.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
# # flat2.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
# flat2.save!
# puts "Flat #{Flat.count}"

# flat3 = Flat.new(
#   name: "Travelodge House",
#   address: "Soho, London",
#   guests: 8,
#   price: 370,
#   property_type: "maisonette",
#   description: Faker::Lorem.sentence(word_count: 20),
#   user: user3
# )
# file = URI.open("https://www.buildington.co.uk/images/projects/1721669518669e978e646361.34063429.jpg")
# flat3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# flat3.save!
# puts "Flat #{Flat.count}"

# flat4 = Flat.new(
#   name: "Palazzo Manfredi",
#   address: "Via Labicana, 125, Roma",
#   guests: 6,
#   price: 570,
#   property_type: "rooftop",
#   description: Faker::Lorem.sentence(word_count: 20),
#   user: user1
# )
# file = URI.open("https://images.trvl-media.com/lodging/2000000/1070000/1065700/1065602/fa75df6a.jpg")
# flat4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# flat4.save!
# puts "Flat #{Flat.count}"

puts "Created #{Flat.count} flats"
