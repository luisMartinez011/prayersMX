FactoryBot.define do
  factory :carrito do
    after(:create) do |order, evaluator|
      create_list(:order, 5, order: [order])
      profile.reload
    end
    total { Faker::Number.decimal(l_digits: 2) }
  end
end
