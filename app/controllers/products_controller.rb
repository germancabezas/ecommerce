class ProductsController < ApplicationController

before_action :authenticate_admin!, :only => [:edit, :destroy]

	def index
		@products = Product.all
		@categories = Category.all
		if params[:sort] == "price"
			@products = Product.where("price <= ?", 1000 )
		end
		if params[:sort] == "price_low_to_high"
			@products = Product.order(:price => :asc)
		end
		if params[:sort] == "price_high_to_low"
			@products = Product.order(:price => :desc)
		end
		if params[:category]
			@products = Category.find_by(:name => params[:category]).products
		end 
		if params[:search]
			@products = @products.where('title LIKE ?', "%" + params[:search] + "%")
		end
	end

	def show
		@categories = Category.all
		if params[:id] == "random"
			@product = Product.all.sample
		else 
			@product = Product.find(params[:id]) 
		end 
		@images = Image.all
	end 

	def new
		@categories = Category.all
	end

	def create 
		@categories = Category.all
		Product.create({:title => params[:title], :price => params[:price]})
		flash[:success] = "Product has been added" # flash => [:success = "message"]  "The :success is calling the bootstrap class for alert so whatever you put after flash[] can be any of the 4 available classes like flash[:info], flash[:success], etc"
		redirect_to '/products' # built in comand to redirect the new product to the index
	end

	def edit
		@categories = Category.all
		@product = Product.find(params[:id])

	end


	def update
		@product = Product.find(params[:id])
		@product.update({:title => params[:title], :price => params[:price]})
		flash[:success] = "Product has been updated"
		redirect_to "/products/#{@product.id}"  # This interpolations to go to each page need to be in between double quotes - NO SIMPLE QUOTES 
		# it could also be done as /#{params[:id]} because is running the id as a parameter and we are grabing the id from the browser
	end	

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		flash[:warning] = "Product has been deleted"
		redirect_to "/products"
	end



end
  

