FactoryGirl.define do
  factory :master_formula do
    formula_number        Faker::Code.isbn
    formula_description   Faker::Book.title
    created_at            Faker::Date.forward(30)
    updated_at            Faker::Date.forward(30)
  end
end
