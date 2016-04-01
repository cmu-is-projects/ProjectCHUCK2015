require "activeable"
class Student < ActiveRecord::Base
include Activeable

  filterrific(
    default_filter_params: { sorted_by: 'name_asc' },
    available_filters: [
      :sorted_by,
      :search_query
    ]
  )

  #callbacks
  before_save :reformat_physician_phone
  before_save :reformat_cell_phone
  before_save :reformat_emergency_cell_phone
  after_validation :check_all_files
  after_create :create_reg
  before_validation :set_active, on: :create
  after_save :studentActive

  #uploaders for carrierwave
  mount_uploader :birth_certificate, AvatarUploader
  mount_uploader :report_card, AvatarUploader
  mount_uploader :physical, AvatarUploader
  mount_uploader :proof_of_insurance, AvatarUploader
  mount_uploader :parent_signature, AvatarUploader

	#Relationship Validations
	belongs_to :household
	# belongs_to :school #for this iteration we are handling school/district as fields in the student model
	has_many :roster_spots
	has_many :registrations, :dependent => :destroy
  has_many :brackets, through: :registrations
  has_many :teams, through: :roster_spots

  

  accepts_nested_attributes_for :registrations, reject_if: lambda { |registration| registration[:student_id].blank? }, allow_destroy: true

  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :first_name, :last_name, :gender, :emergency_contact_name, :emergency_contact_phone, :emergency_contact_relation, :dob, :grade, :pastparticipation, :jersey_size, :school, :district, :gpa, :message => "can't be blank"
  #validates_date :dob, :before => lambda { Date.current }, :message => "cannot be in the future", allow_blank: false, on: :create
  validates_date :dob, :on_or_before => lambda { 6.years.ago.to_date }, :on_or_after => lambda {18.years.ago.to_date}, :message => "must be betweeen ages of 7 and 18"
  #validates_uniqueness_of :email, allow_blank: true
  # validates_format_of :email, :with => /[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))/i
  #validates :email, format: { :with => /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format" }, :allow_blank => true
  #validates :cell_phone, format: { with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed)" }, :allow_blank => true
  #validates :emergency_contact_phone, format: { with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed)" }, :allow_blank => false
  validates :email, format: { :with => /[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))/, :message => "is not a valid format" }, :allow_blank => true
  validates :cell_phone, format: { with: /\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}/, message: "should be 10 digits (area code needed)" }, :allow_blank => true
  validates :emergency_contact_phone, format: { with: /\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}/, message: "should be 10 digits (area code needed)" }, :allow_blank => false
  validates_numericality_of :grade
  GRADESWITHK_ARRAY = [["K", 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [8, 8], [9, 9], [10, 10], [11, 11], [12, 12], ["College", 13]]
  GRADES_ARRAY = (0..13).to_a
  GENDER_ARRAY = ["male","female"]
  validates :grade, inclusion: { in: GRADES_ARRAY, allow_blank: false } 
  validates :gender, inclusion: { in: GENDER_ARRAY, allow_blank: false } 
  # validate :household_is_active_in_system
  validates_presence_of :insurance_provider, :insurance_policy_no, :family_physician, :physical_date, :child_signature#, :parent_signature
  validates :physician_phone, format: { with: /\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}/, message: "should be 10 digits (area code needed)" }, :allow_blank => true
  JERSEYSIZES = ["Youth-Small", "Youth-Medium", "Youth-Large", "Youth-XL", "Adult-Small", "Adult-Medium", "Adult-Large", "Adult-XL",
    "Adult-2XL"]
  GPA_ARRAY = ["4.0 or higher", "3.9 - 3.0", "2.9 - 2.5", "2.4 - 2.0", "1.9 or lower", "Not Applicable"]
  PROJECTCHUCK_YEARS = (0..(Time.now.year - 2003)).to_a
  validates :jersey_size, inclusion: { in: JERSEYSIZES, allow_blank: false }
  validates_date :physical_date, :on_or_after => lambda { 1.year.ago.to_date}
  # validate :ageIsAllowed
  validate :activeBracketsInSystem
  validate :check_agreement

	# Scopes
  # -----------------------------
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :by_age, -> { order ('dob DESC') }
  # scope :by_school,   -> { joins(:school).order('schools.name') }
  scope :by_district,   -> { order('district') }
  scope :by_county,   -> { joins(:household).order('households.county') } #need to change this
  scope :missing_birthcert,  -> { where(has_birth_certificate: 'false')}
  scope :by_grade, ->(grade) { where("grade = ?", grade) }
  scope :with_grade, lambda { |grades|
    where(gender: [*grade])
  }
  scope :by_gender, ->(gender) { where("gender = ?", gender) }
  scope :with_gender, lambda { |genders|
    where(gender: [*genders])
  }
  scope :male, -> { where("gender = ?","Male") }
  scope :female, -> { where("gender = ?", "Female") }
  scope :has_allergies, -> { where('allergies IS NOT NULL')}
  scope :has_medications, -> { where('medications IS NOT NULL')}
  scope :has_rc, -> { where(has_report_card: true) }
  scope :no_rc, -> { where(has_report_card: false) }
  scope :has_phys, -> { where(has_physical: true) }
  scope :no_phys, -> { where(has_physical: false) }
  scope :has_insurance, -> { where(has_proof_of_insurance: true) }
  scope :no_insurance, -> { where(has_proof_of_insurance: false) }
  scope :jerseysize, -> (size) { where("jersey_size LIKE ?", size) }
  scope :has_missing_docs, -> { where("has_report_card = ? OR has_physical = ? OR has_proof_of_insurance = ?", false, false, false) }
  scope :current, joins(:registrations).where('? <= registrations.created_at and registrations.created_at <= ? and registrations.active = ?', Date.new(Date.today.year,1,1), Date.new(Date.today.year,12,31), true)
  scope :search_query, lambda { |query|
  # Searches the students table on the 'first_name' and 'last_name' columns.
  # Matches using LIKE, automatically appends '%' to each term.
  # LIKE is case INsensitive with MySQL, however it is case
  # sensitive with PostGreSQL. To make it work in both worlds,
  # we downcase everything.
  return nil  if query.blank?

  # condition query, parse into individual keywords
  terms = query.downcase.split(/\s+/)

  # replace "*" with "%" for wildcard searches,
  # append '%', remove duplicate '%'s
  terms = terms.map { |e|
    (e.gsub('*', '%') + '%').gsub(/%+/, '%')
  }
  # configure number of OR conditions for provision
  # of interpolation arguments. Adjust this if you
  # change the number of OR conditions.
  num_or_conds = 2
  where(
    terms.map { |term|
      "(LOWER(students.first_name) LIKE ? OR LOWER(students.last_name) LIKE ?)"
    }.join(' AND '),
    *terms.map { |e| [e] * num_or_conds }.flatten
  )
  }
  
  scope :sorted_by, lambda { |sort_option|
  # extract the sort direction from the param value.
  direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
  case sort_option.to_s
  when /^name_/
    # Simple sort on the name colums
    order("LOWER(students.last_name) #{ direction }, LOWER(students.first_name) #{ direction }")
  when /^grade/
    # Simple sort on the created_at column.
    # Make sure to include the table name to avoid ambiguous column names.
    # Joining on other tables is quite common in Filterrific, and almost
    # every ActiveRecord table has a 'created_at' column.
    order("students.grade #{ direction }")
  when /^female_/
    # Simple sort on the name colums
    where("students.gender = ?", 'female')
  when /^male_/
    # Simple sort on the name colums
    where("students.gender = ?", 'male')
  when /^has_allergies_/
    # Simple sort on the name colums
    where("students.allergies != ?", '')
  when /^has_medications_/
    # Simple sort on the name colums
    where("students.medications != ?", '')
  else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
  end
}

  # Methods
  # -----------------------------
  def proper_name
    first_name + " " + last_name
  end
  
  def name
    last_name + ", " + first_name
  end

  def age
    thisyear = Time.now.year
    now = Date.new(thisyear, 6, 1)
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def on_team?
    not(self.teams.empty?)
  end

  def find_bracket
    act_br = Bracket.active
    act_br.each do |br|
      if br.gender == gender && br.min_age <= self.age && br.max_age >= self.age
        return br
      end
    end
    return nil
  end

  def self.options_for_sorted_by
    [
      ['Name (A-Z)', 'name_asc'],
      ['Grades', 'grade_asc'],
      ['Gender - Female', 'female_asc'],
      ['Gender - Male', 'male_asc'],
      ['Has Allergies', 'has_allergies_asc'],
      ['Has Medications', 'has_medications_asc']   
    ]
  end

  def self.genders
    current_registered_students = Student.current.active
    genders = Hash.new
    for stu in current_registered_students
      gender = stu.gender
      if genders[gender].nil?
        genders[gender] = 1
      else
        genders[gender] += 1
      end
    end
    genders.to_a
  end

  def self.school_districts
    current_registered_students = Student.current.active
    school_districts = Hash.new
    for stu in current_registered_students
      stu_school_district = stu.district
      if school_districts[stu_school_district].nil?
        school_districts[stu_school_district] = 1
      else
        school_districts[stu_school_district] += 1
      end
    end
    school_districts.to_a
  end

  def self.jersey_sizes
    current_registered_students = Student.current.active
    jersey_sizes = Hash.new
    for stu in current_registered_students
      stu_jersey_size = stu.jersey_size
      if jersey_sizes[stu_jersey_size].nil?
        jersey_sizes[stu_jersey_size] = 1
      else
        jersey_sizes[stu_jersey_size] += 1
      end
    end
    jersey_sizes.to_a
  end

  def self.ages
    current_registered_students = Student.current.active
    ages = Hash.new
    for stu in current_registered_students
      age = stu.age.to_s
      if ages[age].nil?
        ages[age] = 1
      else
        ages[age] += 1
      end
    end
    ages.to_a
  end

  def self.counties
    cur_reg_students = Student.current.active
    counties = Hash.new
    for stu in cur_reg_students
      if counties[stu.household.county].nil?
        counties[stu.household.county] = 1
      else
        counties[stu.household.county] += 1
      end
    end
    counties.to_a
  end

  def self.all_pending_notifications
    cur_reg_students = Student.current.active.alphabetical
    notif_stu = []
    for stu in Student.current.active
      if not(stu.bc_checkoff)
        if not(stu.has_birth_certificate)
          notif_stu.push([stu,"bc","no_pic"])
        else
          notif_stu.push([stu,"bc","yes_pic"])
        end
      end
      if not(stu.rc_checkoff)
        if not(stu.has_report_card)
          notif_stu.push([stu,"rc","no_pic"])
        else
          notif_stu.push([stu,"rc","yes_pic"])
        end
      end
      if not(stu.poi_checkoff)
        if not(stu.has_proof_of_insurance)
          notif_stu.push([stu,"poi","no_pic"])
        else
          notif_stu.push([stu,"poi","yes_pic"])
        end
      end
      if not(stu.phy_checkoff)
        if not(stu.has_physical)
          notif_stu.push([stu,"ph","no_pic"])
        else
          notif_stu.push([stu,"ph","yes_pic"])
        end
      end
    end
    notif_stu
  end

  def self.students_with_notifications
    cur_reg_students = Student.current.active.alphabetical
    notif_stu = []
    for stu in Student.current.active
      if not(stu.bc_checkoff) or not(stu.rc_checkoff) or not(stu.poi_checkoff) or not(stu.phy_checkoff)
        notif_stu.push(stu)
      end
    end
    notif_stu
  end


  private
     # We need to strip non-digits before saving to db
      def studentActive
        if (self.active == false)
          regs = Registration.where('student_id = ?', self.id)
          regs.each do |reg|
            reg.active = false
            reg.save!
          end
        end
      end

     def set_active
      self.active = true
     end
     
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

  def check_all_files
    if self.birth_certificate.blank?
      self.has_birth_certificate = false
    else
      self.has_birth_certificate = true
    end

    if self.report_card.blank?
      self.has_report_card = false
    else
      self.has_report_card = true
    end

    if self.physical.blank?
      self.has_physical = false
    else
      self.has_physical = true
    end

    if self.proof_of_insurance.blank?
      self.has_proof_of_insurance = false
    else
      self.has_proof_of_insurance = true
    end
  end

  def reformat_physician_phone
    physician_phone = self.physician_phone.to_s  # change to string in case input as all numbers 
    physician_phone.gsub!(/[^0-9]/,"") # strip all non-digits
    self.physician_phone = physician_phone       # reset self.phone to new string
  end

  def create_reg
    flag = false
    #if there are no registrations, then make one
    if self.registrations.to_a.length == 0
      reg = Registration.new
      reg.student_id = self.id
      reg.save!
    else
      #if student has registrations, check if any of the brackets for the registrations are active. if not, then make a new reg
      self.registrations.each do |reg|
        if reg.bracket.active == true
          flag = true
        end
      end
      if flag == false
        reg = Registration.new
        reg.student_id = self.id
        reg.save!
      end
    end
  end


  #function is causing tests to error - not sure why
  #but validation of dob should make this function unnecessary
  # def ageIsAllowed 
  #   if (self.age < 7 || self.age > 18)
  #     errors.add(:student, "student must be between the ages of 7 and 18")
  #   end
  # end

  def activeBracketsInSystem
    if Bracket.all.active.to_a.length == 0
      errors.add(:student, "There are no active brackets in the system")
    end
  end

  def check_agreement
    if (!parent_consent_agree)
      errors.add(:parent, "must agree to Medical Consent Agreement.")
    end
    if (!parent_release_agree)
      errors.add(:parent, "must agree to the Statement of Parental Responsibilities and Release.")
    end
    if (!parent_promise_agree)
      errors.add(:parent, "must agree to the Promise")
    end
    if (!child_promise_agree)
      errors.add(:must, "agree to the Promise.")
    end
  end


    #household_id is valid in system
    # def household_is_active_in_system
    #   all_active_households = Household.active.to_a.map{|u| u.id}
    #   unless all_active_households.include?(self.household_id)
    #     errors.add(:household_id, "is not an active household in the system")
    #   end
    # end 
end
