class Deal < ActiveRecord::Base

  def decrement_price()
    self.price *= 0.99
    self.save
  end
end
