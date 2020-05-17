class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
  end

  def create
    current_user.orders.create(order_params)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(order).permit(:info, :subtotal, :tax, :total, items_attributes: [:name, :description, :subtotal, :tax, :price])
  end
end
