class ExpensesController < ApplicationController
  before_action :set_category, only: [:index, :new, :create]

  def index
    @category = current_user.categories.find(params[:category_id])

    @expenses = @category.expenses
  end

  def new
    @categories = current_user.categories
    @expense = current_user.expenses.new
  end

  def create
    category_ids = expense_params[:category_ids].reject(&:empty?)

    if category_ids.nil? || category_ids.empty?
      render :new, alert: 'Please select at least one category.'
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
