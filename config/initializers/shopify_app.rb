ShopifyApp.configure do |config|
  config.application_name = "Main Shopify App"
  config.api_key = ENV['API_KEY']
  config.secret = ENV['SECRET']
  config.scope = "read_products, write_themes, read_orders"
  config.embedded_app = true
  config.after_authenticate_job = { job: Shopify::AfterAuthenticateJob, inline: false }
  config.session_repository = Shop
  config.webhooks = [
    {topic: 'products/create', address: "https://#{ENV["USER_URL"]}/webhooks/products_create", format: 'json'},
    {topic: 'products/update', address: "https://#{ENV["USER_URL"]}/webhooks/products_update", format: 'json'},
    {topic: 'products/delete', address: "https://#{ENV["USER_URL"]}/webhooks/products_delete", format: 'json'},
    {topic: 'carts/update',    address: "https://#{ENV["USER_URL"]}/webhooks/carts_update"},
    {topic: 'carts/create',    address: "https://#{ENV["USER_URL"]}/webhooks/carts_create"},
    {topic: 'app/uninstalled', address: "https://#{ENV["USER_URL"]}/webhooks/app_uninstalled"}
  ]
end

