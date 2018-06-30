class LineItemsController < ApplicationController

  def index
    @line_items = LineItem.all
  end

  # def create
  #   @cart = @current_cart
  #   chosen_product = Product.find(params[:product_id])
  #   current_cart = @current_cart
  #   @line_item = LineItem.new
  #   @line_item.cart = current_cart
  #   @line_item.product = chosen_product
  #   @line_item.save
  #   redirect_to cart_path(current_cart)
  # end
  #
  # def add_quantity
  #   @line_item = LineItem.find(params[:id])
  #   @line_item.quantity += 1
  #   @line_item.save
  #   redirect_to cart_path(@current_cart)
  # end
  #
  # def reduce_quantity
  #   @line_item = LineItem.find(params[:id])
  #   if @line_item.quantity > 1
  #     @line_item.quantity -= 1
  #   end
  #   @line_item.save
  #   redirect_to cart_path(@current_cart)
  # end

  private
  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id)
  end
end




# def popular
#   @received_products = []
#   popular_line_items = current_cart.line_items.map(&:product_id)
#   popular_line_items.each { |line_item| @received_products << line_item.received_product }
#   @received_products
# end
#
#  cart.line_items.map {|i| [i.cart_id, i.product.id]}
#
#
#
# cart.line_items.collect(&:product_ids).flatten
# cart.product_ids
#
