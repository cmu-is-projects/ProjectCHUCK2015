module Contexts
  module Games

    def create_games
      @bar_cur = FactoryGirl.create(:game, location: @barclays, date: 1.months.from_now.to_date)
      @bar_last = FactoryGirl.create(:game, location: @barclays, date: 13.months.ago.to_date)
      @td_cur = FactoryGirl.create(:game, location: @tdgarden, date: 1.months.from_now.to_date)
      @td_last = FactoryGirl.create(:game, location: @tdgarden, date: 13.months.ago.to_date)
      @msg_cur = FactoryGirl.create(:game, location: @msg, date: 1.months.from_now.to_date)
      @msg_last = FactoryGirl.create(:game, location: @msg, date: 13.months.ago.to_date)
    end

    def remove_games
      @bar_cur.destroy
      @bar_last.destroy
      @td_cur.destroy
      @td_last.destroy
      @msg_cur.destroy
      @msg_last.destroy
    end

  end
end
