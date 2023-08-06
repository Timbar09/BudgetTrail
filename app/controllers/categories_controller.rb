class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.includes(:expenses)
  end
end
