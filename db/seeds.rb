# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
15.times do
  Product.new({
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    price: Faker::Commerce.price
  }).save
end

5.times do
  fak = Faker::Movies::StarWars
  user = User.new({email: Faker::Internet.email, password: "starwars"})
  user.save
  fname = fak.character.split(" ")
  Profile.new({
    name: fname.first,
    last_name: fname.last,
    aka_name: fak.call_sign,
    gender: ['male', 'female'].sample,
    cellphone: Faker::PhoneNumber.phone_number,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    description: fak.wookiee_sentence,
    user: user
  }).save
end

users = User.all
users.each do |user|
  3.times do
    Order.new({
      user: user,
      info: Faker::Lorem.sentence,
      status: [:draft, :active, :finished].sample
      }).save
    req = user.orders.last
    ord_gtot = 0
    ord_stot = 0
    [1,2,3,4,5].sample.times do 
      quantity = [1,2,3].sample
      product = Product.order("RANDOM()").limit(1).first
      stot = product.price.to_f * quantity.to_f
      tax =  stot * Order::TAX_RATE / 100
      total = stot + tax
      Item.new({
        order_id: req.id,
        product_id: product.id,
        quantity: quantity,
        subtotal: stot,
        tax: tax,
        total: total
      }).save
    end
  end
end
