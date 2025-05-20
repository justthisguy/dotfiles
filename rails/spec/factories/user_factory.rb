FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'change_me' }

    # association :profile
    after(:create) do |user, evaluator|
      p = FactoryBot.create :profile, user: user
    end

  end

  trait :verified do
    status { 'verified' }
  end
end
