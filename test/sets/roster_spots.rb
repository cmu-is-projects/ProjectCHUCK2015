module Contexts
  module RosterSpots

    def create_roster_spots
      @bjunker_bt1 = FactoryGirl.create(:roster_spot, team: @bt1, student: @bjunker)
      @jsmith_bt2 = FactoryGirl.create(:roster_spot, team: @bt2, student: @jsmith)
      @sally_gt1 = FactoryGirl.create(:roster_spot, team: @gt1, student: @sally)
      @jane_gt2 = FactoryGirl.create(:roster_spot, team: @gt2, student: @jane)
    end

    def remove_roster_spots
      @bjunker_bt1.destroy
      @jsmith_bt2.destroy
      @sally_gt1.destroy
      @jane_gt2.destroy
    end

  end
end
