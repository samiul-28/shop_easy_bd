class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  def index
    authorize Order

    if current_user.admin?
      @orders = Order.includes(:user, order_items: :product).order(created_at: :desc)
    else
      @orders = current_user.orders.includes(order_items: :product).order(created_at: :desc)
    end
  end

  def new
    @cart = current_user.cart
    @order = Order.new
    authorize @order
  end

  def create
    @cart = current_user.cart
    @order = current_user.orders.build(
      status: 'pending',
      total_price: @cart.cart_items.sum { |item| item.product.price * item.quantity },
      payment_method: params[:order][:payment_method]
    )
    authorize @order

    if @order.save
      @cart.cart_items.each do |item|
        @order.order_items.create!(
          product: item.product,
          quantity: item.quantity,
          price: item.product.price
        )
      end
      @cart.cart_items.destroy_all
      redirect_to order_path(@order), notice: 'Order placed successfully!'
    else
      flash.now[:alert] = 'Failed to place order.'
      render :new
    end
  end

  def show
    authorize @order
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
