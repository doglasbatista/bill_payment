class User < ActiveRecord::Base

  validates :name, presence: true

  def has_enough?(value)
    self.credit >= value
  end
end
