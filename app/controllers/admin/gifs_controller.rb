class Admin::GifsController < Admin::BaseController

  require 'giphy'
  
  def index
    @gifs = Gif.all
  end

  def new
    @gif = Gif.new
  end

  def show
    @gif = Gif.find(params[:id])
  end

  def create
    @category = Category.find_by(search_term: params[:search_term])
    if @category.nil?
      flash[:error] = "Sorry, you can't generate a gif without a category. Add that category now!"
      redirect_to new_category_path
    else
      search_term = @category.search_term
      @gif = Gif.create(image_path: Giphy.random(search_term).image_url.to_s, category_id: @category.id)
      redirect_to admin_gif_path(@gif)
    end
  end

  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    flash[:success] = "Successfully deleted a gif!"
    redirect_to admin_gifs_path
  end

end
