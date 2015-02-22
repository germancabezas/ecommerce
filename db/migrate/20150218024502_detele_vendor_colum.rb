class DeteleVendorColum < ActiveRecord::Migration
  def change
  	remove_column :products, :vendor
  end
end
