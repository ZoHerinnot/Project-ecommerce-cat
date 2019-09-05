class OrdersController < ApplicationController
  
  def create
  	@order = Order.create(user_id: current_user.id)
  	@items = current_user.cart.items
  	@items.each do |item|
  		JoinTableOrderItem.create(item_id:item.id, order_id:@order.id)
  	end
  	@cart = current_user.cart.destroy
    Cart.create(user_id: current_user.id) #crée une panier vide a nouveau
  	redirect_to order_path(@order.id)
  end

  def show
  	@order = current_user.orders.last
    @list_commands = @order.items 
  end

end