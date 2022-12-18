require 'rails_helper'

RSpec.describe Publication, type: :model do
  describe '#factory' do
    it 'is valid' do
      expect(build(:publication)).to be_valid
    end
  end
end