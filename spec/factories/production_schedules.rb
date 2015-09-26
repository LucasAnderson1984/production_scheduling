FactoryGirl.define do
  factory :production_schedule do
    production_date Faker::Date.forward(30)
  end
end
