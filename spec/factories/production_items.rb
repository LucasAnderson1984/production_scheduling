FactoryGirl.define do
  factory :production_item do
    association :item_master
    association :production_formula
    quantity     Faker::Number.number(4).to_i
  end
end
