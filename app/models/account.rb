class Account < ActiveRecord::Base
  include HashId

  has_many :groups
end
