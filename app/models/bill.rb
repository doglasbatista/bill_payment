class Bill < ActiveRecord::Base
  belongs_to :to, class_name: 'User'
  belongs_to :to, class_name: 'User'

  def paid!
    raise I18n.t('bill.raise.already_paid') if paid?
    self.update_attribute(:paid, true)
  end
end
