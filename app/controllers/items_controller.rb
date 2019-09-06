class ItemsController < ApplicationController
  def show
  	@item = Item.find(params[:id])
  end

  def destroy
  	@item = Item.find(params[:id])
  	@item.destroy

  	respond_to do |format|
  		format.js {}
  		format.html{
  			redirect_to user_path		
  		}
  	end
  end
end
