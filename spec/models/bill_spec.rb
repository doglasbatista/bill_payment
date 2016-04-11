require 'rails_helper'

RSpec.describe Bill, type: :model do
  let!(:john) { FactoryGirl.create(:john) }
  let!(:paul) { FactoryGirl.create(:paul) }
  let!(:bill) { FactoryGirl.create(:bill, from_id: john.id, to_id: paul.id) }

  describe '#paid?' do
    it 'paid' do
      bill.paid!
      expect(bill.paid?).to be_truthy
    end

    it 'get a raise' do
      bill.paid!
      expect { bill.paid! }.to raise_error(I18n.t('bill.raise.already_paid'))
    end

    it 'not paid' do
      expect(bill.paid?).to be_falsey
    end
  end

  describe '#make_transfer' do
    it 'have enough' do
      expect(bill.make_transfer).to be_truthy
    end

    it "haven't enough" do
      bill.update_attribute(:amount, 1000)
      expect { bill.make_transfer }.to raise_error(I18n.t('user.raise.not_have_enough'))
    end
  end
end