module Contexts
  module Households

    def create_households
      @kevins = FactoryGirl.create(:household, county: "Greene", home_phone: "4127735465")
      @first = FactoryGirl.create(:household, street: "2 First Ave", county:"Butler", state: "PA", zip:"15289", home_phone: "5552364537")
      @old = FactoryGirl.create(:household, county: "Greene", home_phone: "4123376677", street: "50 Old Dr", active: false)
    end

    def remove_households
      @kevins.destroy
      @first.destroy
      @old.destroy
    end

  end
end
