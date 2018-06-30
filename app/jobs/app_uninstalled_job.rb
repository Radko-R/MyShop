class AppUninstalledJob < ApplicationJob
  def perform(*webhooks)

    return unless webhooks.is_a?(Array)

    webhooks.each do |webhook|
      next unless webhook.key?(:shop_domain)

      shop = Shop.active.find_by(shopify_domain: webhook[:shop_domain])
      next if shop == nil

      shop.update(
        shopify_domain: "#{shop.shopify_domain}-uninstalled-#{shop.id}",
        uninstalled_at: DateTime.now,
        installed: false)
    end
  end
end
