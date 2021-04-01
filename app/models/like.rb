class Like < ApplicationRecord
  belongs_to :user
  belongs_to :dog
  validates_uniqueness_of :user, scope: :dog
end
