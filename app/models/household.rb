class Household < ActiveRecord::Base

	#Relationship Validations
	has_many :guardians
	has_many :students

  accepts_nested_attributes_for :students, reject_if: lambda { |student| student[:first_name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :guardians, reject_if: lambda { |guardian| guardian[:first_name].blank? }, allow_destroy: true

	#arrays to check for inclusion in
	COUNTY_ARRAY = ['Allegheny', 'Armstrong', 'Beaver', 'Butler', 'City of Pittsburgh', 'Fayette', 'Greene', 'Indiana', 'Lawrence']
	STATES_LIST = [['Alabama', 'AL'],['Alaska', 'AK'],['Arizona', 'AZ'],['Arkansas', 'AR'],['California', 'CA'],['Colorado', 'CO'],['Connectict', 'CT'],['Delaware', 'DE'],['District of Columbia ', 'DC'],['Florida', 'FL'],['Georgia', 'GA'],['Hawaii', 'HI'],['Idaho', 'ID'],['Illinois', 'IL'],['Indiana', 'IN'],['Iowa', 'IA'],['Kansas', 'KS'],['Kentucky', 'KY'],['Louisiana', 'LA'],['Maine', 'ME'],['Maryland', 'MD'],['Massachusetts', 'MA'],['Michigan', 'MI'],['Minnesota', 'MN'],['Mississippi', 'MS'],['Missouri', 'MO'],['Montana', 'MT'],['Nebraska', 'NE'],['Nevada', 'NV'],['New Hampshire', 'NH'],['New Jersey', 'NJ'],['New Mexico', 'NM'],['New York', 'NY'],['North Carolina','NC'],['North Dakota', 'ND'],['Ohio', 'OH'],['Oklahoma', 'OK'],['Oregon', 'OR'],['Pennsylvania', 'PA'],['Rhode Island', 'RI'],['South Carolina', 'SC'],['South Dakota', 'SD'],['Tennessee', 'TN'],['Texas', 'TX'],['Utah', 'UT'],['Vermont', 'VT'],['Virginia', 'VA'],['Washington', 'WA'],['West Virginia', 'WV'],['Wisconsin ', 'WI'],['Wyoming', 'WY']]


	# Validations
  # -----------------------------
  validates_format_of :home_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => false
  validates :zip, presence: true, format: { with: /\A\d{5}\z/, message: "should be five digits long", allow_blank: true }
  
  validates :county, inclusion: { in: COUNTY_ARRAY, allow_blank: false }  
  validates :state, inclusion: { in: STATES_LIST.map{|a,b| b}, message: "is not valid state", allow_blank: true }
  

  # Scopes
  # -----------------------------
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # Methods
  # -----------------------------

#get city - might be useful later but NOT NOW

  private
     # We need to strip non-digits before saving to db
     def reformat_home_phone
       home_phone = self.home_phone.to_s  # change to string in case input as all numbers 
       home_phone.gsub!(/[^0-9]/,"") # strip all non-digits
       self.home_phone = home_phone       # reset self.phone to new string
     end

end
