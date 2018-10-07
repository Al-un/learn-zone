FactoryBot.define do

  factory :catalog do
    # https://github.com/stympy/faker
    code { Faker::Alphanumeric.alphanumeric 5 }
    name { Faker::LeagueOfLegends.champion }
    description { Faker::WorldOfWarcraft.quote }
  end

end
