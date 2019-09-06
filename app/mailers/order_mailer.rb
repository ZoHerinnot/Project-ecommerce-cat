class OrderMailer < ApplicationMailer
	default from: 'https://robocat-little.herokuapp.com/'

	def notify_email(order)
		@order = order
		@url = "https://robocat-little.herokuapp.com/"
		mail(to: @order.user.email, subject: 'Commande effectuer !')
	end
end
