require "activeable"
class Volunteer < ActiveRecord::Base
include Activeable
	
  #Relationship Validations
	belongs_to :team
	belongs_to :user
  
  
  mount_uploader :volunteer_sign, AvatarUploader

  before_save :reformat_cell_phone
  before_save :reformat_day_phone
  before_save :set_active, on: :create

  accepts_nested_attributes_for :user, reject_if: lambda { |user| user[:username].blank? }#, allow_destroy: true

  #validations

  STATES_LIST = [['Alabama', 'AL'],['Alaska', 'AK'],['Arizona', 'AZ'],['Arkansas', 'AR'],['California', 'CA'],['Colorado', 'CO'],['Connecticut', 'CT'],['Delaware', 'DE'],['District of Columbia ', 'DC'],['Florida', 'FL'],['Georgia', 'GA'],['Hawaii', 'HI'],['Idaho', 'ID'],['Illinois', 'IL'],['Indiana', 'IN'],['Iowa', 'IA'],['Kansas', 'KS'],['Kentucky', 'KY'],['Louisiana', 'LA'],['Maine', 'ME'],['Maryland', 'MD'],['Massachusetts', 'MA'],['Michigan', 'MI'],['Minnesota', 'MN'],['Mississippi', 'MS'],['Missouri', 'MO'],['Montana', 'MT'],['Nebraska', 'NE'],['Nevada', 'NV'],['New Hampshire', 'NH'],['New Jersey', 'NJ'],['New Mexico', 'NM'],['New York', 'NY'],['North Carolina','NC'],['North Dakota', 'ND'],['Ohio', 'OH'],['Oklahoma', 'OK'],['Oregon', 'OR'],['Pennsylvania', 'PA'],['Rhode Island', 'RI'],['South Carolina', 'SC'],['South Dakota', 'SD'],['Tennessee', 'TN'],['Texas', 'TX'],['Utah', 'UT'],['Vermont', 'VT'],['Virginia', 'VA'],['Washington', 'WA'],['West Virginia', 'WV'],['Wisconsin ', 'WI'],['Wyoming', 'WY']]
  GENDER_ARRAY = ["male","female"]
  AGE_RANGE_LIST = ["Under 18", "18-24", "25-39", "40-59", "Over 60"]

  validates :gender, inclusion: { in: GENDER_ARRAY, allow_blank: false }
  validates :age_range, inclusion: { in: AGE_RANGE_LIST, allow_blank: false }
  validates_presence_of :first_name, :last_name, :role, :dob, :street, :city, :state, :zip, :day_phone, :years_with_proj_chuck, :cell_phone, :email, :shirt_size, :gender, :age_range#, :volunteer_sign#, :act33_clearance, :act34_clearance, :act153_clearance#
  #REQUIRE VOLUNTEER_SIGN AS A DEPLOYMENT CHANGE

  validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format", :allow_blank => true
  validates_format_of :cell_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true
  validates_format_of :day_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true
  validates :zip, format: { with: /\A\d{5}\z/, message: "should be five digits long", allow_blank: true }
  validates :state, inclusion: { in: STATES_LIST.map{|a,b| b}, message: "is not valid state", allow_blank: true }

  SHIRTSIZES = ["S","M","L","XL", "2XL", "3XL", "4XL", "5XL"]
  validates :shirt_size, inclusion: { in: SHIRTSIZES, allow_blank: false }

  #team_id is valid (but not req?)
  ROLE_ARRAY = ["Administrator", "Coach", "Volunteer", "Assistant Coach", "Referee", "Score Table", "Other"]
  validates :role, inclusion: { in: ROLE_ARRAY, allow_blank: false }

  PROJECTCHUCK_YEARS = (0..(Time.now.year - 2001)).to_a
  
  #scopes
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :by_role, ->(role) { where("role = ?", role) }
  scope :by_receives_text_msgs, -> { where(receives_text_msgs: true) }
  scope :unassigned_coaches, -> { where('team_id IS NULL and (role = ? or role = ?)' , "Coach", "Assistant Coach") }
  
  def proper_name
    first_name + " " + last_name
  end
  
  def name
    last_name + ", " + first_name
  end

  def set_active
    self.active = true
  end
  
  private
     # We need to strip non-digits before saving to db
     def reformat_cell_phone
       cell_phone = self.cell_phone.to_s  # change to string in case input as all numbers 
       cell_phone.gsub!(/[^0-9]/,"") # strip all non-digits
       self.cell_phone = cell_phone       # reset self.phone to new string
     end

     def reformat_day_phone
       day_phone = self.day_phone.to_s  # change to string in case input as all numbers 
       day_phone.gsub!(/[^0-9]/,"") # strip all non-digits
       self.day_phone = day_phone       # reset self.phone to new string
     end
    
end
