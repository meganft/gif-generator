class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
      flash[:success] = "You created a new category!"
    else
      flash.now[:error] = "That category already exits. Please try again"
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
    flash[:success] = "You succesfully deleted a category."
  end

  private

  def category_params
    params.require(:category).permit(:search_term)
  end
end
