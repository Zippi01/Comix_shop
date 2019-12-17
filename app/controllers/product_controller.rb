class ProductController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all.order('created_at DESC').paginate(page: params[:page], per_page: 8)
  end

  def show
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
