class Page < ActiveRecord::Base
  belongs_to :group

  attr_accessor :new_group

  validate :url, presence: true
end
