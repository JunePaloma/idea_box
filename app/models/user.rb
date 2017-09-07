class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true, confirmation: true

  enum role: [:default, :admin]
end
