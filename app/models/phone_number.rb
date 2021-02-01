class PhoneNumber < ActiveRecord::Base
  self.table_name = "phone_number"
  belongs_to :account
end