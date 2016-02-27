module Contexts
  module Students

    def create_students
      @kd = FactoryGirl.create(:student, household: @main)
      @klove = FactoryGirl.create(:student, household: @first, first_name: "Sue", last_name: "Jones", emergency_contact_name: "Michael Jones", dob: 12.years.ago.to_date, grade: 6, gender: "female", has_birth_certificate: false, active: false)
    end

    def remove_students
      @kd.destory
      @klove.destroy
    end

  end
end
