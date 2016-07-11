class PaymentsController < ApplicationController
	def create
		token = params[:stripeToken]
		@product = Product.find_by_id(params[:product_id])
		@user = current_user

		begin
			charge = Stripe::Charge.create(
				amount: @product.price,
				:currency => "usd",
				source: token,
				description: params[:stripeEmail]
			)

			if charge.paid
				Order.create(
					product_id: @product.id,
					user_id: @user.id,
					total: @product.price
				)
			end

    flash[:success] = "Your payment was processed successfully"

		rescue Stripe::CardError => e
			body = e.json_body
			err = body[:error]
			flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
		end
	
		redirect_to product_path(@product)
	end
end

