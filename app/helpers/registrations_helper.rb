module RegistrationsHelper
	def get_subscribe_url(user, request)
		url = Rails.env == "production" ? "https://www.paypal.com/cgi-bin/webscr/?" : "https://www.sandbox.paypal.com/cgi-bin/webscr/?"
		url + {
			:ip					=> request.remote_ip,
			:cmd				=> '_s-xclick',
			:hosted_button_id	=> (Rails.env == "production" ? "" : "82FDSTVL8CVML" ),
			:return				=> downloads_pro_url,
			:cancel_return		=> root_url,
			:notify_url			=> payment_notifications_url,
			:allow_note			=> false,
			:custom				=> Base64.encode64("#{user.email}|#{user.password}")
		}.to_query
	end
end
