module Contexts
  module Students

    def create_students
      @jsmith = FactoryGirl.create(:student, household: @main)
      @bjunker = FactoryGirl.create(:student, first_name: "Ben", last_name: "Junker")
      @sally = FactoryGirl.create(:student, first_name: "Sally", last_name: "Smith", gender: "female")
      @lucy = FactoryGirl.create(:student, first_name: "Lucy", last_name: "Goldsmith", gender: "female", active: false)
      @tom = FactoryGirl.create(:student, first_name: "Tom", last_name: "Jenkins", active: false)
      @jane = FactoryGirl.create(:student, first_name: "Jane", last_name: "McIntosh", gender: "female")
      @sjones = FactoryGirl.create(:student, household: @first, first_name: "Sue", last_name: "Jones", emergency_contact_name: "Michael Jones", dob: 12.years.ago.to_date, grade: 6, gender: "female", has_birth_certificate: false, active: false)
    end

    def remove_students
      @jsmith.destory
      @sjones.destroy
      @bjunker.destroy
      @sally.destroy
      @lucy.destroy
      @tom.destroy
      @jane.destory
    end

  end
end
