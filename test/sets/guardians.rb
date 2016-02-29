module Contexts
  module Guardians

    def create_guardians
      @jdoe = FactoryGirl.create(:guardian, household: @main)
      @rkim = FactoryGirl.create(:guardian, household: @first, email: "rkim@roger.net", first_name: "Roger", last_name: "Kim", receives_text_msgs: false, active: true)
      @ip = FactoryGirl.create(:guardian, household: @old, active: false)
    end

    def remove_guardians
      @jdoe.destroy
      @rkim.destroy
      @ip.destroy
    end

  end
end
