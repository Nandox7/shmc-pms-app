class Profile < ApplicationRecord
  belongs_to :user
  has_many :appointments

  #OPTIONS = [['Admin', 'admin' ], ['Nurse', 'nurse'], ['Doctor', 'doctor']]
  OPTIONS = ['User', 'Nurse', 'Doctor', 'Admin']
	
	validates_inclusion_of :role, :in => OPTIONS
	#validates :role, inclusion: OPTIONS

	scope :role , -> (role) { where("role like ?", "Doctor")}

	def full_name
		return "#{firstname} #{lastname}"
	end

	def self.search(search_for)
		Profile.where("lastname like ? or firstname like ?", '%' + search_for + '%', '%' + search_for + '%')
	end

	def is_admin
		return self.role == "Admin"
	end
  
  	def is_doctor
		return self.role == "Doctor"
	end

	def is_nurse
		return self.role == "Nurse"
	end

	def all_doctors
		profiles = Profile.where(role: 'Doctor').order(lastname: :desc)
	end

end
