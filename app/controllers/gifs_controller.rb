class GifsController < ApplicationController
  before_action :require_login, only: [:show, :index, :create, :destroy]

  require 'giphy'

  # def new
  #   @gif = Gif.new
  # end

  def index
    @gifs = Gif.all
  end

  def show
    @gif = Gif.find(params[:id])
  end

  # def create
  #   @category = Category.find_by(search_term: params[:search_term])
  #   if @category.nil?
  #     flash[:error] = "Sorry, you can't generate a gif without a category. Add that category now!"
  #     redirect_to new_category_path
  #   else
  #   search_term = @category.search_term
  #   @gif = Gif.create(image_path: Giphy.random(search_term).image_url.to_s, category_id: @category.id)
  #   redirect_to gif_path(@gif)
  # end
  # end

  # def destroy
  #   @gif = Gif.find(params[:id])
  #   @gif.destroy
  #   redirect_to gifs_path
  # end

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to view this page."
      redirect_to login_path
    end
  end
  #
  # def require_admin_login
  #   unless current_user.admin == true
  #     flash[:error] = "You must be logged in to view this page."
  #     redirect_to login_path
  #   end
  # end

end
