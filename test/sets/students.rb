module Contexts
  module Students

    def create_students
      @jsmith = FactoryGirl.create(:student, household: @main, school: @perry)
      @bjunker = FactoryGirl.create(:student, household: @first, school: @obama, first_name: "Ben", last_name: "Junker")
      @sally = FactoryGirl.create(:student, household: @main, school: @scitech, first_name: "Sally", last_name: "Smith", gender: "female")
      @lucy = FactoryGirl.create(:student, household: @old, school: @perry, first_name: "Lucy", last_name: "Goldsmith", gender: "female", active: false)
      @tom = FactoryGirl.create(:student, household: @old, school: @obama, first_name: "Tom", last_name: "Jenkins", active: false)
      @jane = FactoryGirl.create(:student, household: @first, school: @scitech, first_name: "Jane", last_name: "McIntosh", gender: "female")
      @sjones = FactoryGirl.create(:student, household: @old, school: @perry, first_name: "Sue", last_name: "Jones", emergency_contact_name: "Michael Jones", dob: 9.years.ago.to_date, grade: 6, gender: "female", has_birth_certificate: false, active: false)
    end

    def remove_students
      @jsmith.destroy
      @sjones.destroy
      @bjunker.destroy
      @sally.destroy
      @lucy.destroy
      @tom.destroy
      @jane.destroy
    end

  end
end
