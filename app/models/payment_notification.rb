class PaymentNotification < ActiveRecord::Base
	belongs_to :user
	serialize :params
	after_create :create_new_order_from_transaction

	private
	def create_new_order_from_transaction
		if status == "Completed"
			redirect_to root_path
		end
	end
end
