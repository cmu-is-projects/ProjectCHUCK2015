module Contexts
  module Registrations

    def create_registrations
      @jsmith_reg = FactoryGirl.create(:registration, student: @jsmith, bracket: @current_male_bracket)
      @sjones_reg = FactoryGirl.create(:registration, student: @sjones, bracket: @past_female_bracket)
      @bjunker_reg = FactoryGirl.create(:registration, student: @bjunker, bracket: @current_male_bracket)
      @sally_reg = FactoryGirl.create(:registration, student: @sally, bracket: @current_female_bracket)
      @lucy_reg = FactoryGirl.create(:registration, student: @lucy, bracket: @past_female_bracket)
      @tom_reg = FactoryGirl.create(:registration, student: @tom, bracket: @past_male_bracket)
      @jane_reg = FactoryGirl.create(:registration, student: @jane, bracket: @current_female_bracket)
    end

    def remove_registrations
      @jsmith_reg.destroy
      @sjones_reg.destroy
      @bjunker_reg.destroy
      @sally_reg.destroy
      @lucy_reg.destroy
      @tom_reg.destroy
      @jane_reg.destroy
    end

  end
end
