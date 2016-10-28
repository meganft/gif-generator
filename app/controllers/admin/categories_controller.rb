class Admin::CategoriesController < Admin::BaseController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
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
    if @category.gifs.count == 0
      @category.destroy
      redirect_to admin_categories_path
      flash[:success] = "You succesfully deleted a category."
    else
      redirect_to admin_categories_path
      flash[:error] = "Category still has GIFs! You can't delete it right now."
    end
  end

  private

  def category_params
    params.require(:category).permit(:search_term)
  end
end
