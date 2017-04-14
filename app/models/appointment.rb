class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :profile

	# Set default value if is a new entry
	after_initialize :set_default, unlesss: :persisted?

	def set_default
		self.new = true
	end

	def self.search(search_for)
		Appointment.where("lastname like ?", '%' + search_for + '%')
	end

	def self.search_by_date(search_for)
		Appointment.where("date = ?", search_for)
	end

end
