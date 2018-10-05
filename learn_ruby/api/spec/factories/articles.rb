FactoryBot.define do

  factory :article do
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
  end

end
