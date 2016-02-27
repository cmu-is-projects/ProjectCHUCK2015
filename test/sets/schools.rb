module Contexts
  module Schools

    def create_schools
      @perry = FactoryGirl.create(:school, name: "Perry Highschool", district: "Pittsburgh Public Schools", county: "Allegheny")
      @scitech = FactoryGirl.create(:school, name: "Scitech Academy", district: "Pittsburgh Public Schools", county: "Other")
      @obama = FactoryGirl.create(:school, name: "Obama 6-12", district: "Other", county: "Other")
    end

    def remove_schools
      @perry.destroy
      @scitech.destroy
      @obama.destroy
    end

  end
end
