require "open-uri"


puts "Destroying Flats"
Flat.destroy_all

puts "Destroying Users"
User.destroy_all

puts "Creating Users"
user1 = User.create!(email: "marco@gmail.com", password: "123456", username: "Mark", owner: true)
user2 = User.create!(email: "giorgio@gmail.com", password: "123456", username: "Gigio", owner: false)

puts "Creating Flats"
flat1 = Flat.new(name: "villa Torlonia",
                  guests: 10,
                  country: "Italy",
                  city: "Florence",
                  address: "Via Poggio Gherardo",
                  bedrooms: 5,
                  beds: 5,
                  price: 2500,
                  user: user1,
                  description: "Amazing Villa for an exceptional holiday experience. Magnificent position with views across the solent to the Hampshire coastline, famous for the outstanding sunsets.")

file = URI.open("https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F28%2F2021%2F09%2F13%2Fpool-exterior-italy-villa-northern-tuscany-WINVILLA0921.jpg")
flat1.photos.attach(io: file, filename: 'villa.jpg', content_type: 'image/jpg')
file = URI.open("https://images.easyreserve.com/vacation_rentals/156714/xwide/dsc-8216-easyhdr.jpg")
flat1.photos.attach(io: file, filename: 'villa2.jpg', content_type: 'image/jpg')
flat1.save!
puts "flat #{flat1.id} created"

flat2 = Flat.new(name: "Red House",
                  guests: 4,
                  country: "England",
                  city: "london",
                  address: "4-17 Frederick Terrace",
                  bedrooms: 2,
                  beds: 3,
                  price: 300,
                  wifi: true,
                  user: user2,
                  description: "Beautiful, bright two bedroom bungalow moments from the beach. Perfect for short and long stays. All essential amenities, log burner, garden set and welcome gift and guide included. Exclusive use of full property.")

file = URI.open("https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F28%2F2021%2F09%2F13%2Fpool-exterior-italy-villa-northern-tuscany-WINVILLA0921.jpg")
flat2.photos.attach(io: file, filename: 'red.jpg', content_type: 'image/jpg')
file = URI.open("https://imganuncios.mitula.net/maisonette_in_churton_place_pimlico_london_sw1v_3370104634739008431.jpg")
flat2.photos.attach(io: file, filename: 'red2.jpg', content_type: 'image/jpg')
flat2.save!
puts "flat #{flat2.id} created"

flat3 = Flat.new(name: "Casa Mare",
                  guests: 8,
                  country: "italy",
                  city: "Portofino",
                  address: "Via Duca degli Abruzzi, 31, Portofino",
                  bedrooms: 2,
                  beds: 6,
                  price: 2500,
                  wifi: true,
                  user: user2,
                  description: "Bright and spacious family or holiday home just a short walk from the beach, shopping, and restaurants, nicely positioned at the rear of the desirable gated community of Altos de Flamingo.")

file = URI.open("https://lid.zoocdn.com/645/430/d3208cc41692eff8cdd294d10756795b7fa68a17.jpg")
flat3.photos.attach(io: file, filename: 'portofino.jpg', content_type: 'image/jpg')
file = URI.open("https://lid.zoocdn.com/645/430/5c6f8fcaef9a72130df4ffd93b6aa6155314f433.jpg")
flat3.photos.attach(io: file, filename: 'portofino.jpg', content_type: 'image/jpg')
flat3.save!
puts "flat #{flat3.id} created"


puts "Done!"
