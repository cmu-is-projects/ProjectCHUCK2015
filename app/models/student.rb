class Student < ActiveRecord::Base

	#Relationship Validations
	belongs_to :household
	belongs_to :school
	has_many :roster_spots
	has_many :registrations
    has_many :brackets, through: :registrations
    has_many :teams, through: :roster_spots

    # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :school_id, :household_id, :first_name, :last_name, :gender, :emergency_contact_name, :emergency_contact_phone
  #validates_date :dob, :before => lambda { Date.current }, :message => "cannot be in the future", allow_blank: false, on: :create
  validates_date :dob, :before => lambda { Date.today }
  #validates_uniqueness_of :email, allow_blank: true
  validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format", :allow_blank => true
  validates_format_of :cell_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true
  validates_format_of :emergency_contact_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => false
  grades_array = (0..12).to_a
  validates :grade, numericality: { only_integer: true, allow_blank: false }, inclusion: { in: grades_array, allow_blank: false }  

	# Scopes
  # -----------------------------
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :by_school,   -> { joins(:school).order('schools.name') }
  scope :missing_birthcert,  -> { where(has_birth_certificate: 'false')}
  scope :by_grade, ->(grade) { where("grade = ?", grade) }
  scope :by_gender, ->(gender) { where("gender = ?", gender) }

  # Methods
  # -----------------------------
  def proper_name
    first_name + " " + last_name
  end
  
  def name
    last_name + ", " + first_name
  end

  def age
    return nil if dob.blank?
    (Time.now.to_s(:number).to_i - dob.to_time.to_s(:number).to_i)/10e9.to_i
  end

  private
     # We need to strip non-digits before saving to db
     def reformat_cell_phone
       cell_phone = self.cell_phone.to_s  # change to string in case input as all numbers 
       cell_phone.gsub!(/[^0-9]/,"") # strip all non-digits
       self.cell_phone = cell_phone       # reset self.phone to new string
     end

     def reformat_emergency_cell_phone
       emergency_contact_phone = self.emergency_contact_phone.to_s  # change to string in case input as all numbers 
       emergency_contact_phone.gsub!(/[^0-9]/,"") # strip all non-digits
       self.emergency_contact_phone = emergency_contact_phone       # reset self.phone to new string
     end
end
