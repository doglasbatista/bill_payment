class User < ActiveRecord::Base

  def has_enough?(value)
    self.credit >= value
  end
end
