class Guardian < ActiveRecord::Base

	#relationships
	belongs_to :household
  
  #validations
  
  validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format", :allow_blank => true
  validates_format_of :cell_phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true
  validate :household_is_active_in_system

  #scopes
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  scope :alphabetical, -> { order('last_name, first_name') }
  scope :by_receives_text_msgs, -> { where(receives_text_msgs: true) }
  
  #methods
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
    
   #household_id is valid in system
  def household_is_active_in_system
    all_active_households = Household.active.to_a.map{|u| u.id}
    unless all_active_households.include?(self.household_id)
      errors.add(:household_id, "is not an active household in the system")
    end
  end 

end
