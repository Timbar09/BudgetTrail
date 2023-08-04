class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :category_expense, dependent: :destroy
  has_many :expenses, through: :category_expense

  validates :name, presence: true, length: { minimum: 1, maximum: 25 }
end
