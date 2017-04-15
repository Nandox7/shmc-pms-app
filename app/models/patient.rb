class Patient < ApplicationRecord
	has_many :appointments

	def full_name
		return "#{firstname} #{lastname}"
	end

	def self.search(search_for)
		Patient.where("lastname like ? or firstname like ?", '%' + search_for + '%',  '%' + search_for + '%')
	end
	
end
