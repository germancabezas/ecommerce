class ChangeProductAtributes < ActiveRecord::Migration
  def change
  	add_column :products, :vendor, :string	
  end
end
