class ProductController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all.order('created_at DESC').paginate(page: params[:page], per_page: 8)
  end

  def min_price
    @products = Product.min_price.paginate(page: params[:page], per_page: 8)
    render action: :index
  end

  def max_price
    @products = Product.max_price.paginate(page: params[:page], per_page: 8)
    render action: :index
  end

  def sort_new
    @products = Product.sort_new.paginate(page: params[:page], per_page: 8)
    render action: :index
  end

  def sort_old
    @products = Product.sort_old.paginate(page: params[:page], per_page: 8)
    render action: :index
  end

  def show
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
