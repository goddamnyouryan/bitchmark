class Account < ActiveRecord::Base

  has_many :groups

  before_validation :create_hash_id

  def to_param
    hash_id
  end

  private

  def create_hash_id
    self.hash_id = SecureRandom.hex.first(7)
  end
end
