class Backoffice::OrdersController < BackOfficeController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
end
