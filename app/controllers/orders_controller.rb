class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.add_cart_items_from_cart(@current_cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to home_path
      flash[:success] = "Ваше замовлення успішно створене"
    end

  end

private

  def order_params
    params.require(:order).permit(:name, :email, :address, :pay_method)
  end
end
