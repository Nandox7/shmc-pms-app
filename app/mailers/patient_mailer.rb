class PatientMailer < ApplicationMailer
    default from: 'shmcpmsapp@example.com'

    def welcome_email(patient)
        @patient = patient
        @url = 'http://example.com/login'
        mail(to: 'nandox7@gmail.com', subject: 'Welcome email')
    end
    
end
