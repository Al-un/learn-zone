FactoryBot.define do

  factory :article do
    # https://github.com/stympy/faker
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
  end

end
