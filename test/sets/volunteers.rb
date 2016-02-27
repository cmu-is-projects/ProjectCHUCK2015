module Contexts
  module Volunteers

    def create_volunteers
			@coach_bt1 = FactoryGirl.create(:volunteer, team: @boy_1, role: "Coach", first_name: "Coach", last_name: "Bt1", email: "coach@bt1.com")
			@coach_bt2 = FactoryGirl.create(:volunteer, team: @boy_2, role: "Coach", first_name: "Coach", last_name: "Bt2", email: "coach@bt2.com")
			@coach_gt1 = FactoryGirl.create(:volunteer, team: @girl_1, role: "Coach", first_name: "Coach", last_name: "Gt1", email: "coach@gt1.com")
			@coach_gt2 = FactoryGirl.create(:volunteer, team: @girl_2, role: "Coach", first_name: "Coach", last_name: "Gt2", email: "coach@gt2.com")
			@volunteer = FactoryGirl.create(:volunteer)
			@admin = FactoryGirl.create(:volunteer, role: "Administrator", first_name: "Tasha", last_name: "Wilson-Batch", email: "tasha@batch.com")
    end

    def remove_volunteers
	@coach_bt1.destroy
			@coach_bt2.destroy
			@coach_gt1.destroy
			@coach_gt2.destroy
			@volunteer.destroy
			@admin.destroy
    end

  end
end
