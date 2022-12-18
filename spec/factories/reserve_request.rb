require 'factory_bot'
require 'faker'
FactoryBot.define do

    factory :reserve_request do
        approval_state { 'true' }
        start_date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 60) }
        finish_date { Faker::Time.between(from: DateTime.now, to: DateTime.now + 60) }
        association :publication, factory: :publication
        association :user, factory: :user
    end
end 