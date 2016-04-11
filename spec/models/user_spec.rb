require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#has_enough?' do
    let!(:user) { FactoryGirl.create(:user) }

    it 'have enough' do
      expect(user.has_enough?(49)).to be_truthy
    end

    it 'have just enough' do
      expect(user.has_enough?(50)).to be_truthy
    end

    it "haven't enough" do
      expect(user.has_enough?(51)).to be_falsey
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

end
