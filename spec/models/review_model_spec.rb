require 'rails_helper'

RSpec.describe Review, type: :model do
    describe '#factory' do
        it 'is valid' do
            expect(build(:review)).to be_valid
        end 
    end
end