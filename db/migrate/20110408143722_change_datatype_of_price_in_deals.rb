class ChangeDatatypeOfPriceInDeals < ActiveRecord::Migration
  def self.up
    change_column :deals, :price, :decimal, :precision => 12, :scale => 2
  end

  def self.down
    change_column :deals, :price, :float
  end
end
