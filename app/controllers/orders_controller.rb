class OrdersControllers < ApplicationController
	protect_from_forgery 
	before_filter :authenticate_user!

	def index
		@orders = Order.all.to_json(include: [{product: {only: :name}}, {user: {only: :email}}])
    	respond_with @orders
	end

	def show
		@order = Order.find(params[:id]).to_json(include: [{product: {only: :name}}, {user: {only: :email}}])
    	respond_with @orders
	end

	def new
	end

	def create
		@order = Order.create(order_params)
    	respond_with @order
	end

	def destroy
		respond_with Order.destroy(params[:id])
	end

	protected
  
	def json_request?
	request.format.json?
	end
  
	private
  
	def order_params
    	params.require(:order).permit(:product_id, :user_id, :total)
	end
end

