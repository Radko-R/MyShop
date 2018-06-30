class CartsUpdateJob < ActiveJob::Base
  def perform(shop_domain:, webhook:)
    p webhook
    shop = Shop.find_by(shopify_domain: shop_domain)
    Sync::Cart.new(webhook: webhook, shop: shop).cart_after_webhook
    p webhook
  end
end




