class Location < ActiveRecord::Base
  
  #Relationships
  has_many :games


  #Validations
  validates_presence_of :name
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :zip
  validates_presence_of :state

  #format validations
	validates_format_of :zip, with: /\A\d{5}\z/, message: "should be five digits long"


	us_state_abbrevs = ['AL', 'AK', 'AS', 'AZ', 'AR', 'CA', 'CO', 'CT', '
		DE', 'DC', 'FM', 'FL', 'GA', 'GU', 'HI', 'ID', 'IL', 'IN', 'IA', 
		'KS', 'KY', 'LA', 'ME', 'MH', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 
		'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'MP', 'OH', 
		'OK', 'OR', 'PW', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 
		'VT', 'VI', 'VA', 'WA', 'WV', 'WI', 'WY']
	validates :state, length: {is: 2}, inclusion: {in: us_state_abbrevs}
end
