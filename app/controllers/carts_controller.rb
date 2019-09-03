class CartsController < ApplicationController

  def create

  end

  def show
    @cart = Cart.find_by(user_id:current_user.id)
    @price_total = 0
    @list_commands = []
    @cart.list_commands.each do |cart| #liste de tous les comma
      @list_commands << Item.find(cart.item_id)
      @price_total += Item.find(cart.item_id).price
    end
  end

  def destroy
    @list_command = ListCommand.find_by(item_id:params[:format],cart_id:params[:id])
    @list_command.destroy
    redirect_to cart_path(params[:id])
  end



end

=begin

  <%=current_user.id%> <!-- user_signed_in? si true tsy conecté-->

=end
