class User < ActiveRecord::Base
  before_save { self.username = username.downcase }
  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_many :posts
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
