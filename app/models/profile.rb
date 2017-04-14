class Profile < ApplicationRecord
  #OPTIONS = [['Admin', 'admin' ], ['Nurse', 'nurse'], ['Doctor', 'doctor']]
  OPTIONS = ['Default', 'Nurse', 'Doctor', 'Admin']
	validates_inclusion_of :role, :in => OPTIONS
	#validates :role, inclusion: OPTIONS

	belongs_to :user

	scope :rolw , -> (role) { where("role like ?", "Doctor")}


	def user_full_name
		"#{firstname} #{lastname}"
	end

	def get_all_doctors
	end

	def is_admin
		return self.role == "Admin"
	end
end
