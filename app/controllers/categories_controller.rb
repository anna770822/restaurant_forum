class CategoriesController < ApplicationController
  def show
    @restaurants = Category.find(params[:id])
  end
end
