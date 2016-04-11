class Bill < ActiveRecord::Base
  belongs_to :to, class_name: 'User'
  belongs_to :from, class_name: 'User'

  def make_transfer
    self.from.make_transfer(to: self.to, amount: self.amount)
  end

  def paid!
    raise I18n.t('bill.raise.already_paid') if paid?
    self.update_attribute(:paid, true)
  end
end
