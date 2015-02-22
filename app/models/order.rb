class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	belongs_to :product_option

	def calculate_subtotal 
		return product.price * quantity
	end

	def calculate_tax 
		return 0.09 * calculate_subtotal
	end

	def calculate_total
		return calculate_subtotal + calculate_tax
	end

end
 