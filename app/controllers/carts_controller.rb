class CartsController < ApplicationController
  
  def create
    if user_signed_in?
      if current_user.cart.items.include?(Item.find(params[:format])) == false
         ListCommand.create( cart: current_user.cart, item: Item.find(params[:format]) )
         redirect_to root_path 
      end
    else
      redirect_to new_user_registration_path 
    end
  end

  def show
    if user_signed_in?
        @price_total = 0
        @list_commands = current_user.cart.items
        @list_commands.each do |list_command| 
          @price_total += list_command.price
        end
    else
      redirect_to new_user_registration_path
    end
  end

  def destroy
    

    @list_command = ListCommand.find_by(item_id:params[:id], cart_id: current_user.cart.id)
    @list_command.destroy
    respond_to do |format|
      format.js do  
        @price_total = 0
        @command = current_user.cart.items
        @command.each do |list_command| 
          @price_total += list_command.price
        end
      end
      format.html{ redirect_to root_path }
    end
  end

end

=begin
puts "*"*90
    puts params.inspect
    puts "*"*90
=end