class AddUninstalledAtToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :uninstalled_at, :datetime, null: true, after: :shopify_token
  end
end
