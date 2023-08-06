class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_expense, dependent: :destroy
  has_many :expenses, through: :category_expense

  validates :name, presence: true, length: { minimum: 1, maximum: 25 }

  has_one_attached :icon

  def total_transactions
    expenses.sum(:amount)
  end
end
