class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :profile

	# Set default value if is a new entry
	after_initialize :set_default, unlesss: :persisted?

	def set_default
		self.new = true
	end

	def self.search_by_patient(search_for)
		Appointment.where("lastname like ?", '%' + search_for + '%')
	end

	def self.search_by_date(date_start, date_end)
		Appointment.where("appointmentdate >= ? and appointmentdate <= ?", date_start, date_end)
	end

	# Required for the calendar widget
	def start_time
        self.appointmentdate
    end

end
