class User < ApplicationRecord
  has_secure_password

  has_many :contacts

  validates :username, :password, :password_confirmation, presence: true
end
