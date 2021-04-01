class Dog < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes
end
