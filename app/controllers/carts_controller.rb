class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    cart = current_user.cart || current_user.create_cart
    @cart_items = cart.cart_items.includes(:product)
  end
  def create
    cart = current_user.cart || current_user.create_cart
    product = Product.find(params[:product_id])
  
    cart_item = cart.cart_items.find_by(product_id: product.id)
    if cart_item
      cart_item.increment(:quantity)
    else
      cart_item = cart.cart_items.new(product: product, quantity: 1)
    end
  
    if cart_item.save
      redirect_back fallback_location: root_path, notice: "Added to cart!"
    else
      redirect_back fallback_location: root_path, alert: "Could not add to cart."
    end
  end
  def checkout
    @cart = current_user.cart
    @cart_items = @cart.cart_items.includes(:product)
  
    total = @cart_items.sum { |item| item.product.price * item.quantity }
  
    order = current_user.orders.create!(
      total: total,
      status: "completed" 
    )
  
    @cart_items.each do |item|
      order.order_items.create!(
        product: item.product,
        quantity: item.quantity,
        price: item.product.price
      )
    end
  
    @cart_items.destroy_all
  
    redirect_to orders_path, notice: "Checkout complete! Your order has been placed."
  end
  
  
  
end

