price = Faker::Commerce.price
stot = price / 1.15
FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    description { Faker::ChuckNorris.fact }
    subtotal { stot }
    tax { price - stot }
    price { price }
  end
end
