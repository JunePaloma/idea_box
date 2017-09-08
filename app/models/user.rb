class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true

  enum role: [:default, :admin]
end
