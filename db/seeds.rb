require 'faker'

Category.create(name: "Barbecued Meats")
Category.create(name: "Baseball Equipment")
Category.create(name: "Board Games")
Category.create(name: "Bruce Springsteen Albums")

30.times do
  Post.create(title: Faker::Book.title, body: Faker::StarWars.quote, price: rand(0..100), category_id: rand(1..4))
end
