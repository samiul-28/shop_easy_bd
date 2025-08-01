class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = current_user.cart || current_user.create_cart
    product = Product.find(params[:product_id])
    cart_item = cart.cart_items.find_by(product_id: product.id)

    if cart_item
      cart_item.increment(:quantity)
    else
      cart_item = cart.cart_items.build(product: product, quantity: 1)
    end

    if cart_item.save
      redirect_to cart_path, notice: 'Product added to cart.'
    else
      redirect_to products_path, alert: 'Unable to add product.'
    end
  end

  def update
    cart_item = current_user.cart.cart_items.find(params[:id])
    if cart_item.update(quantity: params[:quantity])
      redirect_to cart_path, notice: 'Quantity updated.'
    else
      redirect_to cart_path, alert: 'Failed to update quantity.'
    end
  end

  def destroy
    cart_item = current_user.cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart.'
  end
end

