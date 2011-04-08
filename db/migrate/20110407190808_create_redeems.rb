class CreateRedeems < ActiveRecord::Migration
  def self.up
    create_table :redeems do |t|
      t.integer :deal_id
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :redeems
  end
end
