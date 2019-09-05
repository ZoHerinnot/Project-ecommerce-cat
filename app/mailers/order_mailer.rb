class OrderMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'

	def notify_email(order)
		@order = order
		@url = "http://monsite.fr/login"
		mail(to: @order.user.email, subject: 'Commande effectuer !')
	end
end
