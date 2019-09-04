class CartsController < ApplicationController

  def create

    if current_user.cart == nil
      Cart.create(user_id: current_user.id)
    end

    if current_user.cart.items.include?(Item.find(params[:format])) == false
       ListCommand.create( cart: current_user.cart, item: Item.find(params[:format]) )
    end
      
  end


  def show
    
    if current_user.cart == nil
      Cart.create(user_id: current_user.id)
    end

    @price_total = 0
    @list_commands = current_user.cart.items
    @list_commands.each do |list_command| #liste de tous les comma
      @price_total += list_command.price
    end
  end

  def destroy
    @list_command = ListCommand.find_by(item_id:params[:id], cart_id: current_user.cart.id)
    @list_command.destroy
    redirect_to cart_path(params[:id])
  end

end

=begin

  <%=current_user.id%> <!-- user_signed_in? si true tsy conecté-->

=end
