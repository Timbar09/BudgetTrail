class ExpensesController < ApplicationController
  before_action :set_category, only: %i[index new create]

  def index
    @expenses = @category.expenses.order(created_at: :desc)
  end

  def new
    @categories = current_user.categories
    @expense = current_user.expenses.new
  end

  def create
    category_ids = expense_params[:category_ids].reject(&:empty?)

    if category_ids.nil? || category_ids.empty?
      redirect_to new_category_expense_path(@category), alert: 'Please select at least one category.' and
        return
    end

    data = expense_params.except(:category_ids)
    @expense = current_user.expenses.new(data)

    if @expense.save
      @expense.categories << Category.find(category_ids)

      redirect_to category_expenses_path(@category), notice: 'Expense created successfully.'
    else
      render :new, alert: 'Error: Expense not created.'
    end
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, category_ids: [])
  end
end
