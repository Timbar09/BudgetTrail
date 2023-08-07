class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.includes(:expenses)

    @grand_total = @categories.map(&:total_expenses).sum
  end

  def new
    @category = current_user.categories.new
  end

  def create
    @category = current_user.categories.new(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category created successfully'
    else
      render :new, alert: 'Error: Category not created'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
