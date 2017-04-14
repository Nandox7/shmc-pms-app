json.extract! patient, :id, :firstname, :lastname, :dateofbirth, :address, :contact, :details, :special, :created_at, :updated_at
json.url patient_url(patient, format: :json)
