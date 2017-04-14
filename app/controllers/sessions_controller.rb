class SessionsController < Devise::SessionsController
	before_filter :authenticate_user!
	# after_sign_in_path_for(user)
	'/signedinuserprofile' 

end
