class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :shop_id
      t.string :shopify_id
      t.string :token
      t.string :shopify_token
      t.string :token
      t.string :shop_domain
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end







