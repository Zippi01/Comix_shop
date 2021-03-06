class Backoffice::OrdersController < BackOfficeController
  before_action :find_order, only: %i[edit update]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit; end

  def update
    if @order.update_attributes(order_params)
      redirect_to admin: @order
      flash[:notice] = "#{t("flash.controller.message8")}"
    else
      format.html { render :edit }
    end
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :comment)
  end
end
