class BasicProfile
    def initialize(vpat, vprof, vappoint)
        @vPatients = vpat
        @vProfiles = vprof
        @vAppointments = vappoint
        @description = "Basic Profile"
    end
    
    # getter method
    def viewpatients 
        return @vPatients
    end
    
    # a method which returns a string representation of the object
    def details
        return @description + "; " + @vPatients + "; " + @vProfiles + ": " + @vAppointments
    end
    
    # getter method
    def viewprofiles
        return @vProfiles
    end
    
    # getter method
    def vuewappointments 
        return @vAppointments
    end
    
end 



# decorator class -- this serves as the superclass for all the concrete decorators
# the base/super class decorator (i.e. no actual decoration yet), each concrete decorator (i.e. subclass) will add its own decoration
class ProfileDecorator < BasicProfile
    def initialize(basic_profile)
        @basic_profile = basic_profile
        super(@basic_profile.vPatients, @basic_profile.vProfiles, @basic_profile.vAppointments)
        @description = "no permissions"
    end
    
    # override the details method to include the description of the extra feature
    def details
        return  @description + ": " + ". " + @basic_profile.details
    end
    
end 



class AdminDecorator < ProfileDecorator
    def initialize(basic_profile)
        super(basic_profile)
        @vProfiles = true
        @vPatients = true
        @vAppointments = true
        @description = "Admin Profile"
    end
    
end 


class DoctorWindowsDecorator < ProfileDecorator
    def initialize(basic_profile)
        super(basic_profile)
        @vProfiles = false
        @vPatients = true
        @vAppointments = true
        @description = "Doctor Profile"
    end
    
end 


class NurseDecorator < ProfileDecorator
    def initialize(basic_profile)
        super(basic_profile)
        @vPatients = false
        @vProfiles = false
        @vAppointments = true
        @description = "Nurse Profile"
    end
    
end


