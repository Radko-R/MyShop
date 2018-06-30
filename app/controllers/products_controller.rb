class ProductsController < ShopifyApp::AuthenticatedController

  before_action :set_shop

  def index
    products = @current_shop.products.products_top
    @popular_products = products.first(10)
    @unpopular_products = products.last(10).reverse
  end

  # def index
  #   @popular_products = Product.popular_products
  #   @unpopular_products = Product.unpopular_products
  # end
end

private

def set_shop
  @current_shop ||= Shop.find_by(shopify_domain: session[:shopify_domain])
end




