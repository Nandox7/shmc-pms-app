class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :profile

	# Set default value if is a new entry
	after_initialize :set_default, unlesss: :persisted?

	def set_default
		self.new = true
	end

end
