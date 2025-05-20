FactoryBot.define do
  factory :profile do
    name_given { Faker::Name.first_name }
    name_family { Faker::Name.last_name }
    name_others { Faker::Name.middle_name + ' ' + Faker::Name.middle_name }
    nickname { Faker::Name.female_first_name }
    location { Faker::Address.city }
    description { Faker::Lorem.sentences }
    image { "https://models.com/work/refinery-29-androgynous-models-talk-about-beauty" }
  end
end
