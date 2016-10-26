class GifsController < ApplicationController
  require 'giphy'

  def new
    @gif = Gif.new
  end

  def index

    @gifs = Gif.all
  end

  def show
    @gif = Gif.find(params[:id])
  end

  def create
    @category = Category.find_by(search_term: params[:search_term])
    search_term = @category.search_term
    @gif = Gif.create(image_path: Giphy.random(search_term).image_url.to_s, category_id: @category.id)
    redirect_to gif_path(@gif)
  end


  def destroy
    @gif = Gif.find(params[:id])
    @gif.destroy
    redirect_to gifs_path
  end

end
