class User < ApplicationRecord
  has_secure_password
  has_many :ideas
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true

  enum role: [:default, :admin]
end
