FactoryBot.define do
  factory :producto do
    nombre { Faker::Name.name }
    precio { Faker::Number.decimal(l_digits: 2) }
    descripcion do
      Faker::Lorem.sentence(
        word_count: 3,
        supplemental: false,
        random_words_to_add: 4
      )
    end
    imagen do
      Faker::LoremFlickr.image(size: "300x300", search_terms: %w["shirt"])
    end
  end
end
