class OrdersController < ApplicationController

	def create
		product = Product.find(params[:product_id])
		quantity = params[:quantity].to_i 
		order = Order.new(:user_id => current_user.id, :quantity => quantity, :product_id => product.id)
		order.subtotal = order.calculate_subtotal
		order.tax = order.calculate_tax
		order.total = order.calculate_total
		order.save

		flash[:success] = "Your item has been added has been added" # flash => [:success = "message"]  "The :success is calling the bootstrap class for alert so whatever you put after flash[] can be any of the 4 available classes like flash[:info], flash[:success], etc"
		redirect_to '/products'

	end

end
