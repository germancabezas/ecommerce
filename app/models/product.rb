class Product < ActiveRecord::Base

	belongs_to :vendor
	has_many :product_options
	belongs_to :user
	has_many :images
	has_many :categorized_products
	has_many :categories, :through => :categorized_products
	#cart
	has_many :carted_product
	has_many :orders, :through => :carted_products
	#validations
	validates :price, presence: true



	def discounted_price
	if price <= 2
		return "Discounted"
	else
		return "On Sale!"
	end
	end
	def add_tax
		return (price.to_i*9)/100

	end
	def total
			return price + add_tax 
	end

	def friendly_created_at
		return created_at.strftime("%b %d, %y")
	end

end
