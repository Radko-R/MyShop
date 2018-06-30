class ShopsController < ShopifyApp::AuthenticatedController
  before_action :set_shop

  def set_shop
    @current_shop ||= Shop.find_by(shopify_domain: session[:shopify_domain])
  end
end
