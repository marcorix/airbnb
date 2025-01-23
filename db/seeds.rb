require 'faker'

puts "Cleaning DB"

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
# file1 = URI.open("https://plus.unsplash.com/premium_photo-1661313639796-8c38ae96756f?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
# file2 = URI.open("https://images.unsplash.com/photo-1512359953714-f0c9a632ab85?q=80&w=2890&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
# file3 = URI.open("https://images.unsplash.com/photo-1510265119258-db115b0e8172?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
# flat1.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
# flat1.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
# flat1.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat1.save!

flat2 = Flat.new(
  name: "Skysreaper view",
  address: "Stratford, London",
  guests: 6,
  price: 440,
  property_type: "flat",
  user: user2
)
flat2.save!

flat3 = Flat.new(
  name: "Travelodge House",
  address: "Soho, London",
  guests: 8,
  price: 370,
  property_type: "maisonette",
  user: user3
)
# file1 = URI.open("https://images.unsplash.com/photo-1619460485417-82881a4c984d?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
# file2 = URI.open("https://images.unsplash.com/photo-1613775967978-d07fb817ce9a?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
# file3 = URI.open("https://images.unsplash.com/photo-1640872162491-776671bd7d79?q=80&w=2874&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
# flat2.photos.attach(io: file1, filename: "nes.png", content_type: "image/png")
# flat2.photos.attach(io: file2, filename: "nes.png", content_type: "image/png")
# flat2.photos.attach(io: file3, filename: "nes.png", content_type: "image/png")
flat3.save!

puts "Created #{Flat.count} flats"
