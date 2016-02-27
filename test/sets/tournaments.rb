module Contexts
  module Tournaments

    def create_tournaments
      @current_tourn = FactoryGirl.create(:tournament)
      @past_tourn = FactoryGirl.create(:tournament, name: "Last year's tournament", start_date: 2.years.ago.to_date, end_date: 1.years.ago.to_date)
    end

    def remove_tournaments
      @current_tourn.destroy
      @past_tourn.destroy
    end

  end
end
