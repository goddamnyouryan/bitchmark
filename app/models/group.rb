class Group < ActiveRecord::Base

  belongs_to :account
  has_many :pages
end