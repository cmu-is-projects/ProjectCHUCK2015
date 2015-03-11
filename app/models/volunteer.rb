class Volunteer < ActiveRecord::Base
	
  #Relationship Validations
	belongs_to :team
	has_one :user
  
  #validations
  validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format", :allow_blank => true
  validates_format_of :cell_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true
  #team_id is valid (but not req?)
  role_array = ["administrator", "coach", "volunteer"]
  validates :role, inclusion: { in: role_array, allow_blank: false }
  
  #scopes
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :by_role, ->(role) { where("role = ?", role) }
  scope :receives_text_msgs, -> { where(receives_text_msgs: true) }
  scope :no_text_msgs, -> { where(receives_text_msgs: false) }
  
  def proper_name
    first_name + " " + last_name
  end
  
  def name
    last_name + ", " + first_name
  end
  
  private
     # We need to strip non-digits before saving to db
     def reformat_cell_phone
       cell_phone = self.cell_phone.to_s  # change to string in case input as all numbers 
       cell_phone.gsub!(/[^0-9]/,"") # strip all non-digits
       self.cell_phone = cell_phone       # reset self.phone to new string
     end
   end
	
end
