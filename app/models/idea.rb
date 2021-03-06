class Idea < ApplicationRecord

  belongs_to :category
  belongs_to :user
  has_many :idea_images
  has_many :images, through: :idea_images
end
