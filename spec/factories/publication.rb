require 'factory_bot'
require 'faker'
FactoryBot.define do

    factory :publication do
        title { Faker::Lorem.sentence }
        synopsis { Faker::Lorem.paragraph }
    end

end 