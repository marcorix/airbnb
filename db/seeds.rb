puts "Destroying Flats"
Flat.destroy_all

puts "Destroying Users"
User.destroy_all

puts "Creating Users"
user_1 = User.create!(email: "marco@gmail.com", password: "123456")
user_2 = User.create!(email: "giorgio@gmail.com", password: "123456")

puts "Creating Flats"
flat_1 = Flat.new(name: "villa Torlonia",
                  guests: 10,
                  country: "italy",
                  city: "Roma",
                  bedrooms: 5,
                  beds: 5,
                  price: 2500,
                  description: "Amazing Villa for an exceptional holiday experience. Magnificent position with views across the solent to the Hampshire coastline, famous for the outstanding sunsets."
                )
flat_1.user = user_1
flat_1.save!
puts "flat id=#{flat_1.id} created"


flat_2 = Flat.new(name: "Red House",
  guests: 4,
  country: "england",
  city: "Bristol",
  bedrooms: 2,
  beds: 3,
  price: 300,
  description: "Beautiful, bright two bedroom bungalow moments from the beach. Perfect for short and long stays. All essential amenities, log burner, garden set and welcome gift and guide included. Exclusive use of full property."
)
flat_2.user = user_2
flat_2.save!
puts "flat id=#{flat_2.id} created"

puts "Done!"
