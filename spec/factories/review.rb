require 'factory_bot'
require 'faker'
FactoryBot.define do

    factory :review do
        rating { '5' }
        content { Faker::Lorem.sentence }
        association :publication, factory: :publication
        association :user, factory: :user
    end
end 