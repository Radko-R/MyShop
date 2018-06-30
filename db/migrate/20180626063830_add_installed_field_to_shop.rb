class AddInstalledFieldToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :installed, :boolean, default: true
  end
end
