FactoryGirl.define do
  factory :role, class: Role do
    name Faker::Lorem.word

    trait :admin do
      name 'admin'
    end

    trait :scheduler do
      name 'scheduler'
    end

    trait :moderator do
      name 'moderator'
    end

    factory :user_role_admin do
      name 'admin'
    end

    factory :user_role_moderator do
      name 'moderator'
    end

    factory :user_role_scheduler do
      name 'scheduler'
    end
  end
end
