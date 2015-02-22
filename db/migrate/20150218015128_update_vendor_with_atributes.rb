class UpdateVendorWithAtributes < ActiveRecord::Migration
  def change
  	add_column :vendors, :name, :string	
  	add_column :vendors, :email, :string	
  	add_column :vendors, :phone, :string	
  end
end
