class Api::V1::OutboundController < ApplicationController
	def sms
	# Expected API Behavior
	# - The API should do input validation
	# - If the pair ‘to’, ‘from’ matches any entry in cache (STOP), return an error (see Output
	# JSON response below).
	# - Using cache, do not allow more than 50 API requests using the same ‘from’ number in 24
	# hours from the first use of the ‘from’ number and reset counter after 24 hours. Return an
	# error in case of limit reached (see Output JSON response below).
	# - If the ‘from’ parameter is not present in the phone_number table for this specific account
	# you used for the basic authentication, return an error (see Output JSON response
	# below).
	end
end
