class User < ApplicationRecord
  validates_presence_of :email, :password
  validates_uniqueness_of :email

  has_secure_password

  has_secure_token :api_key
end
