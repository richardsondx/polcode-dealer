class Deal < ActiveRecord::Base
  has_one :reedem

  def decrement_price
    self.price *= 0.99
    self.save
  end
end
