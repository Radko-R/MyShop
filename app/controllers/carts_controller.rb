class CartsController < ShopifyApp::AuthenticatedController

  before_action :set_shop

  def index
    @carts = Kaminari.paginate_array(@current_shop.carts.all).page(params[:page]).per(10)
  end


  private

  def set_shop
    @current_shop ||= Shop.find_by(shopify_domain: session[:shopify_domain])
  end
end

