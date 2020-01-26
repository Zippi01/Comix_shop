# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  # Character.create(name: 'Luke', movie: movies.first)
Category.create(title: "Book", description:"Book Collections")
Category.create(title: "Magazine", description:"Magazine Collections")
Category.create(title: "Manga", description:"Manga Collections")
#
10.times do |i|
  Product.create(title: "Book #{i}", description: "Book", price: 1+i, category_id: 1)
end

10.times do |i|
  Product.create(title: "Magazine #{i}", description: "Magazine", price: 2+i, category_id: 2)
end

10.times do |i|
  Product.create(title: "Manga #{i}", description: "Manga", price: 3+i, category_id: 3)
end
User.create(email: "email@gmail.com", password: "email", admin: true)
