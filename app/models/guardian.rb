require 'activeable'
class Guardian < ActiveRecord::Base
include Activeable

  #relationships
  has_many :households
  belongs_to :user
  
  #validations
  validates_presence_of :first_name, :last_name, :cell_phone
  validates :email, format: { :with => /[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))/i, :message => "is not a valid format" }, :allow_blank => true
  validates :cell_phone, format: { with: /\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}/, message: "should be 10 digits (area code needed)" }
  # validate :household_is_active_in_system

  #scopes
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
    
  # NOTE: household_id is valid in system
  # def household_is_active_in_system
  #   all_active_households = Household.active.to_a.map{|u| u.id}
  #   unless all_active_households.include?(self.household_id)
  #     errors.add(:household_id, "is not an active household in the system")
  #   end
  # end 

end
