class Tag < ActiveRecord::Base
  has_many :connections
  has_many :blogs, through: :connections
end
