class OrdersController < ApplicationController
	after_action :create_order, only:[:create]
	def new
		@payed = params[:prix]		
	end


  def create
	
	# Amount in cents
	@payed = params[:price]

	@amount = "500"

	
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

		current_user.cart.destroy
    Cart.create(user_id: current_user.id) 

		redirect_to user_path(current_user.id)

  end

  def show
  	@order = current_user.orders.last
    @list_commands = @order.items 
  end


  private
  

  def create_order
  	# @order = Order.create(user_id: current_user.id)
  	# @items = current_user.cart.items
  	# @items.each do |item|
  	# 	JoinTableOrderItem.create(item_id:item.id, order_id:@order.id)
  	# end
  	@cart = current_user.cart.destroy
    Cart.create(user_id: current_user.id) #crée une panier vide a nouveau
  end


end