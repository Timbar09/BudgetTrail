class User < ApplicationRecord
  has_many :categories
  has_many :expenses

  validates :name, presence: true, length: { minimum: 1, maximum: 25 }
end
