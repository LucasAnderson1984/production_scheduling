FactoryGirl.define do
  factory :user do
    email     Faker::Internet.email
    password  Faker::Internet.password(8, 20)

    trait :confirmed do
      confirmed_at Time.now
    end

    trait :admin do
      after :build do |user, _evaluator|
        user.add_role :admin
      end
    end

    trait :moderator do
      after :build do |user, _evaluator|
        user.add_role :moderator
      end
    end

    trait :scheduler do
      after :build do |user, _evaluator|
        user.add_role :scheduler
      end
    end

    trait :all_roles do
      confirmed

      after :build do |user, _evaluator|
        Role::ROLE_NAMES.each { |r| user.add_role r}
      end
    end

    trait :authenticated do
      confirmed

      after :build do |user, _evaluator|
        user.add_role :moderator
      end
    end
  end
end
