FactoryBot.define do
  factory :user do
    email {FactoryBot.generate :email}
    password { 'change_me' }
  end

  trait :verified do
    status { 'verified' }
  end
end
