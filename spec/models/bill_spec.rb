require 'rails_helper'

RSpec.describe Bill, type: :model do
  let!(:john) { FactoryGirl.create(:john) }
  let!(:paul) { FactoryGirl.create(:paul) }

  describe '#paid?' do
    before do
      @bill = FactoryGirl.create(:bill, from_id: john.id, to_id: paul.id)
    end

    it 'paid' do
      @bill.paid!
      expect(@bill.paid?).to be_truthy
    end

    it 'get a raise' do
      @bill.paid!
      expect { @bill.paid! }.to raise_error(I18n.t('bill.raise.already_paid'))
    end

    it 'not paid' do
      expect(@bill.paid?).to be_falsey
    end
  end
end