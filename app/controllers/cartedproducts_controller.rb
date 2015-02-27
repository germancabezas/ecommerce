class CartedproductsController < ApplicationController
	  before_action :authenticate_user! #, :only => [:create]

	def index 
		@categories = Category.all
		@order = Order.find_by(:status => "Carted", :user_id => current_user.id)
		Order.find_by(:user_id => current_user.id, :status => "Carted")
		@carted_products = @order.carted_products
	end

	def create
		order = Order.find_by(:status => "Carted", :user_id => current_user.id)
		if order
			CartedProduct.create(:product_id => params[:product_id], :quantity => params[:quantity], :order_id => order.id)
		else
			Order.create(:status => "Carted", :user_id => current_user.id)
			CartedProduct.create(:product_id => params[:product_id], :quantity => params[:quantity], :order_id => order.id) 
		end
		flash[:success] = "Added products"
		redirect_to '/cartedproducts'
	end
end
