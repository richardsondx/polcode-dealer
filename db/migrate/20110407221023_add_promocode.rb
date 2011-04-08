class AddPromocode < ActiveRecord::Migration
  def self.up
    alter_table :redeems do |t|
      t.string :promocode
    end
  end

  def self.down

  end
end
