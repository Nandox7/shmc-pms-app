class Patient < ApplicationRecord
	has_many :appointments

	def patient_full_name
		"#{firstname} #{lastname}"
	end

	def self.search(search_for)
		Patient.where("lastname like ?", '%' + search_for + '%')
	end
	
end
