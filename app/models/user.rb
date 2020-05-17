class User < ApplicationRecord
  has_secure_password

  has_one :profile
  has_many :orders
end
