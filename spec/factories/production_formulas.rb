FactoryGirl.define do
  factory :production_formula do
    association :master_formula
    association :production_schedule
    tonnage     Faker::Number.number(4).to_i
  end
end
