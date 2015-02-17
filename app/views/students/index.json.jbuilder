json.array!(@students) do |student|
  json.extract! student, :id, :household_id, :first_name, :last_name, :dob, :cell_phone, :email, :grade, :gender, :emergency_contact_name, :emergency_contact_phone, :has_birth_certificate, :allergies, :medications, :security_question, :security_response, :active
  json.url student_url(student, format: :json)
end
