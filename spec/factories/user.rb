require 'factory_bot'
require 'faker'
FactoryBot.define do

    factory :user do
        email { Faker::Internet.email }
        name { Faker::Name.name }
        phone { Faker::Base.numerify('########') }
        password { '123123' }
        password_confirmation { '123123' }
        user_type { 'client' }
    end

end 

