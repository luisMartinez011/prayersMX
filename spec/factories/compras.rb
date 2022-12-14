FactoryBot.define do
  factory :compra do
    total { Faker::Number.decimal(l_digits: 2) }
    usuario
    after(:create) do |order, evaluator|
      create_list(:order, 5)
      order.reload
    end
    #orders { Array.new(5) { association(:order, profiles: [instance]) } }
  end
end
