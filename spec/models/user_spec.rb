require 'rails_helper'

RSpec.describe User do
  subject { build(:user, password: nil) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_inclusion_of(:integration_type).in_range(1..3) }

    context 'when password is present' do
      before { subject.password = 'test' }
      it { is_expected.to validate_presence_of(:password_confirmation) }
      it { is_expected.to validate_confirmation_of(:password) }
    end
  end

  describe '#authenticate!' do
    context 'when there is the user' do
      let!(:user) { create(:user, email: 'u@gmail.com', password: '123456') }

      it 'returns the correct user' do
        expect(User.authenticate!('u@gmail.com', '123456')).to eq(user)
      end
    end

    context 'when there is not the user' do
      it 'raise an ActiveRecord::RecordNotFound' do
        expect {
          User.authenticate!('u@gmail.com', '123456')
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
