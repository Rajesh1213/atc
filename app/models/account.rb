class Account < ActiveRecord::Base
	self.table_name = "account"
	has_many :phone_numbers
	
	def self.phone_number_exists?(num)
		joins(:phone_numbers).where( phone_number: { number: num } ).first.present?
	end
end