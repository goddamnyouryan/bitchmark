class Group < ActiveRecord::Base
  include HashId

  default_scope { order('position asc') }

  belongs_to :account
  has_many :pages, dependent: :destroy
end
