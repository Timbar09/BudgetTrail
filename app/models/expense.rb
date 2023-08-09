class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expense, dependent: :destroy
  has_many :categories, through: :category_expense

  validates :name, presence: true, length: { minimum: 1, maximum: 25 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
