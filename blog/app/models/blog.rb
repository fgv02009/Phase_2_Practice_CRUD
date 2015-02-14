class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :connections
  has_many :tags, through: :connections

  # belongs_to :author, class_name: "User", foreign_key: :author_id
end
