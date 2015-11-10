require 'rails_helper'

RSpec.describe User do
  subject { build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_inclusion_of(:integration_type).in_range(1..3) }
  end
end
