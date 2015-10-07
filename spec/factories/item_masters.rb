FactoryGirl.define do
  factory :item_master do
    item_number   Faker::Code.isbn
    description   Faker::Book.title
    association   :master_formula
    created_at    Faker::Date.forward(30)
    updated_at    Faker::Date.forward(30)
  end
end
