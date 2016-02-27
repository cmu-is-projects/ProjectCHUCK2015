module Contexts
  module TeamGames

    def create_team_games
      @bt1_bar = FactoryGirl.create(:team_game, team: @boy_1, game: @bar_cur, score: 100)
      @bt2_bar = FactoryGirl.create(:team_game, team: @boy_2, game: @bar_cur, score: 98)
      @bt1_td = FactoryGirl.create(:team_game, team: @boy_1, game: @td_cur, score: 80)
      @bt2_td = FactoryGirl.create(:team_game, team: @boy_2, game: @td_cur, score: 91)
      @gt1_msg = FactoryGirl.create(:team_game, team: @girl_1, game: @msg_cur, score: 93)
      @gt2_msg = FactoryGirl.create(:team_game, team: @girl_2, game: @msg_cur, score: 90)
    end

    def remove_team_games
      @bt1_bar.destroy
      @bt2_bar.destroy
      @bt1_td.destroy
      @bt2_td.destroy
      @gt1_msg.destroy
      @gt2_msg.destroy
    end

  end
end
