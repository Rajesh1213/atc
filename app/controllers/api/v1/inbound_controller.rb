class Api::V1::InboundController < ApplicationController
	before_action :get_params, only: [:sms]
	ActionController::Parameters.permit_all_parameters = true

# Expected API Behavior
# - The API should do input validation
# - If the ‘to’ parameter is not present in the phone_number table for this specific account you used for the basic authentication, return an error (see Output JSON response below).
# - When text is STOP or STOP\n or STOP\r or STOP\r\n
# - The ‘from’ and ‘to’ pair must be stored in cache as a unique entry and should expire after 4 hours.

	def sms
		begin
			msg = { "message": "inbound sms ok", "error": "" }

			# return missing param error message
			msg = { "message": "", "error": "#{missing_params} parameter not found" } if missing_params.length > 0

			# return if the phn number doesn't exists in the account.
			msg = { "message": "", "error": "to parameter not found" } if !Account.phone_number_exists?(get_params[:to])

			message = get_params[:message]
			write_to_redis if !message.nil? && message.include?("STOP")
		
			rescue => e
				msg = { "message": "", "error": e.message }
			end
		
			render json: msg
	end

	def missing_params
		res = []
		%w( to from message ).map{ |p| res << p unless get_params.has_key?(p) }
		res
	end

	def write_to_redis
		# get to and from and write to redis 
	end

	private
	
	def get_params
		params.require(:inbound).permit(:to, :from, :message)
	end
end
