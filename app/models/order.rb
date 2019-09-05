class Order < ApplicationRecord
	after_create :notify_send
	belongs_to :user
	has_many :join_table_order_items
	has_many :items, through: :join_table_order_items
	def notify_send
		OrderMailer.notify_email(self).deliver_now
	end
end
