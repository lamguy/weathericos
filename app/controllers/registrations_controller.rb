class RegistrationsController < Devise::RegistrationsController
	include RegistrationsHelper

	def create
		build_resource(sign_up_params)

		if resource.valid?
			redirect_to get_subscribe_url(resource, request)
		else
			super
		end
	end
end
