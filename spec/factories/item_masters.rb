FactoryGirl.define do
  factory :item_master do
    item_number     Faker::Code.isbn
    description     Faker::Book.title
    association     :master_formula
    weight          Faker::Number.number(4).to_i
    units_per_case  Faker::Number.number(4).to_i
    pallet_height   Faker::Number.number(4).to_i
    cases_per_layer Faker::Number.number(4).to_i
    created_at      Faker::Date.forward(30)
    updated_at      Faker::Date.forward(30)
  end
end
