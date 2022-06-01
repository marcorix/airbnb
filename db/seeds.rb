require "open-uri"


puts "Destroying Flats"
Flat.destroy_all

puts "Destroying Users"
User.destroy_all

puts "Creating Users"
user1 = User.create!(email: "marco@gmail.com", password: "123456")
user2 = User.create!(email: "giorgio@gmail.com", password: "123456")

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
                  user: user2,
                  description: "Beautiful, bright two bedroom bungalow moments from the beach. Perfect for short and long stays. All essential amenities, log burner, garden set and welcome gift and guide included. Exclusive use of full property.")

file = URI.open("https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F28%2F2021%2F09%2F13%2Fpool-exterior-italy-villa-northern-tuscany-WINVILLA0921.jpg")
flat2.photos.attach(io: file, filename: 'red.jpg', content_type: 'image/jpg')
file = URI.open("https://imganuncios.mitula.net/maisonette_in_churton_place_pimlico_london_sw1v_3370104634739008431.jpg")
flat2.photos.attach(io: file, filename: 'red2.jpg', content_type: 'image/jpg')
flat2.save!
puts "flat #{flat2.id} created"

puts "Done!"
