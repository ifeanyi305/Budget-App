# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transfer, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:transfer) { Transfer.new(name: 'John Doe', amount: 20, author: user) }
  let(:invalid_attributes) { { name: nil, amount: -5, author: user } }

  describe 'validations' do
    it 'is not valid without a name' do
      transfer.name = nil
      expect(transfer).not_to be_valid
    end

    it 'is valid with a name' do
      expect(transfer).to be_valid
    end

    it 'is an integer' do
      transfer.amount = 20
      expect(transfer.amount).to be_an_instance_of(Integer)
    end

    it 'is invalid' do
      transfer = Transfer.new(invalid_attributes)
      expect(transfer).to_not be_valid
    end

    it 'returns the expected error message' do
      transfer = Transfer.new(invalid_attributes)
      transfer.valid?
      expect(transfer.errors[:amount]).to include('must be an integer greater than or equal to zero.')
    end
  end
end
