class Profile < ApplicationRecord
  belongs_to :user
  has_many :appointments

  #OPTIONS = [['Admin', 'admin' ], ['Nurse', 'nurse'], ['Doctor', 'doctor']]
  OPTIONS = ['User', 'Nurse', 'Doctor', 'Admin']
	
	validates_inclusion_of :role, :in => OPTIONS
	#validates :role, inclusion: OPTIONS

	scope :role , -> (role) { where("role like ?", "Doctor")}

	def user_full_name
		"#{firstname} #{lastname}"
	end

	def self.search(search_for)
		Profile.where("lastname like ?", '%' + search_for + '%')
	end

	def is_admin
		return self.role == "Admin"
	end
  
	def all_doctors
		profiles = Profile.where(role: 'Doctor').order(lastname: :desc)
	end
	

end
