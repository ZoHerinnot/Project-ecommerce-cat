class UsersController < ApplicationController
	def index
		
	end

	def show
		@user = current_user
	end

	def edit
		@user = User.find(current_user.id)
		
	end

	def update
		@user = User.find(current_user.id)
		user_params = params.require(:user).permit(:first_name, :last_name, :email)
		if @user.update(user_params)
			redirect_to action: "show"
		else
			render :edit
		end
	end
end
