json.extract! appointment, :id, :appointmentdate, :appointmenttime, :new, :observations, :patient_id, :profile_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
