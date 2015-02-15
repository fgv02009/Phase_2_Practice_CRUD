class User < ActiveRecord::Base
  has_many :blogs

  validate :username, uniqueness: :true


  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      return user
    end
  end

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
