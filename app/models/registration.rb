class Registration < ActiveRecord::Base
  
  #Callbacks
  before_save :reformat_physician_phone

  #Relationship Validations
  belongs_to :bracket
  belongs_to :student

  #Validations
  validate :student_is_active_in_system
  validates_format_of :physician_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true
  jerseysizes = ["S","M","L","XL"]
  validates :jersey_size, inclusion: { in: jerseysizes, allow_blank: false }
  validates_date :physical_date, :after => lambda { 1.year.ago.to_date }

  #Scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :has_rc, -> { where(has_report_card: true) }
  scope :no_rc, -> { where(has_report_card: false) }
  scope :has_phys, -> { where(has_physical: true) }
  scope :no_phys, -> { where(has_physical: false) }
  scope :has_insurance, -> { where(has_proof_of_insurance: true) }
  scope :no_insurance, -> { where(has_proof_of_insurance: false) }
  scope :jerseysize, -> (size) { where("jersey_size LIKE ?", size) }
  scope :has_missing_docs, -> { where("has_report_card = ? OR has_physical = ? OR has_proof_of_insurance = ?", false, false, false) }


  #custom functions 
  def bracket_has_spots?
   if (self.bracket.registrations.length < self.bracket.max_students)
   	return true
   else
   	self.errors.add :bracket, "does not have any open spots: #{self.bracket}"
   end
  end

private
  def student_is_active_in_system
    all_active_students = Student.active.to_a.map{|u| u.id}
    unless all_active_students.include?(self.student_id)
      errors.add(:student_id, "is not an active student in the system")
    end
  end

  def reformat_physician_phone
    physician_phone = self.physician_phone.to_s  # change to string in case input as all numbers 
    physician_phone.gsub!(/[^0-9]/,"") # strip all non-digits
    self.physician_phone = physician_phone       # reset self.phone to new string
  end
  
end
