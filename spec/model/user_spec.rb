require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'ifeanyi', email: 'otijosephat305@gmail.com', password: 'ifyjapan',
             password_confirmation: 'ifyjapan')
  end

  describe 'validations' do
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is valid with a name' do
      expect(subject).to be_valid
    end
  end
end
