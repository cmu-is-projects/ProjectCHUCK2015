class RosterSpot < ActiveRecord::Base

  #Callback
  before_validation :checkActive, on: :create

  #Relationship Validations
  belongs_to :student
  belongs_to :team

  #Validations
  validate :student_is_active_in_system

  #Scopes
  scope :by_position, -> { order('position') }
  scope :active, -> { where('end_date IS NULL') }
  scope :by_student,   -> { joins(:student).order('students.last_name, students.first_name') }
  #scope :unassigned, -> { joins(:student).where('student.roster_spot.team_id IS NULL') }

  private
  def student_is_active_in_system
    all_active_students = Student.active.to_a.map{|u| u.id}
    unless all_active_students.include?(self.student_id)
      errors.add(:student_id, "is not an active student in the system")
    end
  end

  def checkActive
    self.active = true
  end
end


