module Contexts
  module Teams

    def create_teams
      @boy_1 = FactoryGirl.create(:team, bracket: @current_male_bracket, num_wins: 1, num_losses: 1, name: "Cavs")
      @boy_2 = FactoryGirl.create(:team, bracket: @current_male_bracket, num_wins: 1, num_losses: 1, name: "Wizards")
      @girl_1 = FactoryGirl.create(:team, bracket: @current_female_bracket, num_wins: 1, name: "Thunder")
      @girl_2 = FactoryGirl.create(:team, bracket: @current_female_bracket, num_losses: 1, name: "Hawks")
    end

    def remove_teams
      @boy_1.destroy
      @boy_2.destroy
      @girl_1.destroy
      @girl_2.destroy
    end

  end
end
