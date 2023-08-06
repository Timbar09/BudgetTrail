class ExpensesController < ApplicationController
  before_action :set_category, only: [:index]

  def index
    @expenses = @category.expenses
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end
end
