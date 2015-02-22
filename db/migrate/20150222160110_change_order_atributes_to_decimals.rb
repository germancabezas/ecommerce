class ChangeOrderAtributesToDecimals < ActiveRecord::Migration
  def change
  	    change_column :orders, :subtotal, :decimal
  	    change_column :orders, :tax, :decimal
  	    change_column :orders, :total, :decimal
	  	remove_column :orders, :decimal


  end
end
