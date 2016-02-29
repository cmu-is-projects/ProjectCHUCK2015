require "activeable"
class Registration < ActiveRecord::Base
include Activeable

  #Callbacks
  before_validation :assign_bracket
  before_validation :checkActive, on: :create


  #Relationship Validations
  belongs_to :bracket
  belongs_to :student


  # NOTE: Validations
  # validate :student_is_active_in_system
  # validates_presence_of :bracket_id, :student_id
  

  #Scopes
  scope :by_bracket, ->(bracket) { where("bracket_id = ?", bracket) } 

  #custom functions 
  def bracket_has_spots?
   if (self.bracket.registrations.length < self.bracket.max_students)
   	return true
   else
   	self.errors.add :bracket, "does not have any open spots: #{self.bracket}"
   end
  end

private
  # def student_is_active_in_system
  #   all_active_students = Student.active.to_a.map{|u| u.id}
  #   unless all_active_students.include?(self.student_id)
  #     errors.add(:student_id, "is not an active student in the system")
  #   end
  # end

  def assign_bracket
    #NOTE: THIS IS AT RISK OF AN INFITIE LOOP
      until self.bracket_id != nil do
        Bracket.all.active.each do |bracket|
          if (self.student.age >= bracket.min_age) && (self.student.age <= bracket.max_age) && (self.student.gender == bracket.gender)
            self.bracket_id = bracket.id
          end
        end
      end
  end

  def checkActive
    self.active = true
  end
  
end
