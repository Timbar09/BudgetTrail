class ExpensesController < ApplicationController
  before_action :set_category, only: [:index]

  def index
    @category = current_user.categories.find(params[:category_id])

    @expenses = @category.expenses
  end

  def new
    @categories = current_user.categories
    @expense = current_user.expenses.new
  end

  def create
    category_ids = expense_params[:category_ids]

    if category_ids.nil || category_ids.empty?
      render :new, alert: 'Please select at least one category.'
      return
    end

    data = expense_params.except(:category_ids)
    @expense = current_user.expenses.new(data)

    if @expense.save
      category_ids.each do |category_id|
        @expense.category_expenses.create(category_id: category_id)
      end

      redirect_to expenses_path, notice: 'Expense created successfully.'
    else
      render :new, alert: 'Error: Expense not created.'
    end
  end

  private

  def set_category
    

  def expense_params
    params.require(:expense).permit(:name, :amount, :category_ids: [])
  end
end
