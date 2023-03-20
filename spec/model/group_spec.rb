require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'John Doe') }
  let(:transfer) { Transfer.create(name: 'John Doe', amount: 20, author: user) }
  let(:group) {Group.new(name: 'john doe', icon: 'fa fa-bas', user: user)}

  describe "validations" do
    it 'is not valid without a name' do
      group.name = nil
      expect(group).not_to be_valid
    end

    it 'is valid with a name' do
      expect(group).to be_valid
    end
  end
end
