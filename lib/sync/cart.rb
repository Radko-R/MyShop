module Sync
  class Cart
    attr_accessor :shop, :carts_ids, :shopify_cart_ids, :shopify_carts_collection, :webhook


    def initialize(args = {})
      args.each { |k, v| send("#{k}=", v) }
      @shopify_cart_ids = []
    end

    def cart_after_webhook
      @webhook = OpenStruct.new(webhook)
      update_cart
    end

    def update_cart
      cart = shop.carts.find_or_initialize_by(shopify_id: webhook.id)
      shopify_product_ids = webhook.line_items.map{ |line_item| line_item['product_id']}
      cart.products = shop.products.where(shopify_id: shopify_product_ids)
      cart.save
    end
  end
end





# sql = <<~SQL
#     select products.id as product_id, products.title as title, count(line_items.id) as current_count from products
#     inner join line_items where line_items.product_id = products.id
#     GROUP by products.id
#     ORDER BY current_count DESC
# SQL
#
# q = ActiveRecord::Base.connection.exec_query(sql)
# q.rows.map{|r| q.columns.zip(r).to_h }
#












# Cart.last.line_items

# p webhook['line_items'].map{ |line_item| line_item['product_id']}

# shop.products.where(shopify_id: [1009581359161, 962849964089, 1009519525945])


    # def update_cart
    #   cart = shop.carts.find_or_initialize_by(shopify_id: webhook.id)
    #   cart.save
    # end

    # cart = shop.carts.all.map{|c|c.products}.flatten

    # def update_carts
    #   @carts_ids = cart_shopify_ids
    #   @shopify_carts_collection.each do |shopify_cart|
    #     if carts_validation(shopify_cart)
    #       shopify_cart = OpenStruct.new(shopify_cart)
    #     end
    #     @shopify_carts_ids.push shopify_cart.id.to_s
    #     update_cart
    #   end
    #   destroy_old_carts
    # end
    #
    # def carts_validation(shopify_cart)
    #   shopify_cart.is_a? Hash
    # end
    #
    # def cart_shopify_ids
    #   shop.carts.map(&:shopify_id)
    # end
    #
    # def destroy_old_carts
    #   shop.carts.where(shopify_id: old_cart_ids).destroy_all
    # end
    #
    # def old_cart_ids
    #   carts_ids - shopify_carts_ids
    # end







