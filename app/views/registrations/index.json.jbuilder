json.array!(@registrations) do |registration|
  json.extract! registration, :id, :student_id, :bracket_id, :has_report_card, :has_proof_of_insurance, :insurance_provider, :insurance_policy_no, :family_physician, :physician_phone, :has_physical, :physical_date, :jersey_size, :active
  json.url registration_url(registration, format: :json)
end
