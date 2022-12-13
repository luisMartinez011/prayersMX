FactoryBot.define do
  factory :order do
    producto
    total { Faker::Number.decimal(l_digits: 2) }
  end
end
