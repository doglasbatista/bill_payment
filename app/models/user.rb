class User < ActiveRecord::Base

  validates :name, presence: true

  def has_enough?(value)
    self.credit >= value
  end

  def make_transfer(options={})
    raise I18n.t('user.raise.not_have_enough') unless has_enough?(options[:amount])
    transaction do
      options[:to].update_attribute(:credit, credit + options[:amount])
      self.update_attribute(:credit, credit - options[:amount])
    end
  end
end
