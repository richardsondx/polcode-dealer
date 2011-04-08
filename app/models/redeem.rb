class Redeem < ActiveRecord::Base
  belongs_to :deal
  
  before_validation :create_promocode
  
  validates_presence_of :email
  validates_uniqueness_of :email, :scope => :deal_id,
      :message => "you already have it!"
  validates_uniqueness_of :promocode

  protected
  
  def create_promocode
    self.promocode = Digest::SHA1.hexdigest Time.now.to_s+email
  end
  
end
