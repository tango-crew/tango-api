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
end
