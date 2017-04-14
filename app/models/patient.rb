class Patient < ApplicationRecord
	has_many :appointments

	def patient_full_name
		"#{firstname} #{lastname}"
	end
end
