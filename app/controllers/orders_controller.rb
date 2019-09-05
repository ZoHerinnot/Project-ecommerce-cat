class OrdersController < ApplicationController
	def new
		@payed = params[:prix]		
	end

  def create
	
	# Amount in cents
	@payed = params[:price]
	
	@amount = 500

	
	customer = Stripe::Customer.create({
	  email: params[:stripeEmail],
	  source: params[:stripeToken],
	})
  
	charge = Stripe::Charge.create({
	  customer: customer.id,
	  amount: @amount,
	  description: 'Rails Stripe customer',
	  currency: 'usd',
	})
	 
     rescue Stripe::CardError => e
	flash[:error] = e.message
	redirect_to new_charge_path
	
  	@order = Order.create(user_id: current_user.id)
  	@items = current_user.cart.items
  	
  	@items.each do |item|
  		JoinTableOrderItem.create(item_id:item.id, order_id:@order.id)
  	end
  
  	@cart = current_user.cart.destroy
  	redirect_to order_path(@order.id)
  end

  def show
  	@order = current_user.orders.last
    @list_commands = @order.items 
  end

 
end