class UserMailer < ApplicationMailer
	def order_confirmation order_id, user_id
		# puts ApplicationController.instance_methods
		user = User.find(user_id)
		puts user.email
		@order = Order.joins(line_items: :product).find(order_id)
		# mail(to: ApplicationController.current_user.email, subject: "Order ##{order_id}")
	end
end
