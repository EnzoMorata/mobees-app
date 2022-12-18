require 'rails_helper'

RSpec.describe ReserveRequest, type: :model do
    describe '#factory' do
        it 'is valid' do
            expect(build(:reserve_request)).to be_valid
        end 
    end
end