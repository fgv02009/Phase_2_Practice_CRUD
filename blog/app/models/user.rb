class User < ActiveRecord::Base
  has_many: blogs

  validate :username unique: :true
end
