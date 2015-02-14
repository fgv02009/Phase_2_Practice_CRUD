class Blog < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :connections
  has_many :tags, through: :connections
end
