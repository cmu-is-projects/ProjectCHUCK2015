module Contexts
  module Volunteers

    def create_volunteers
      @coach_bt1 = FactoryGirl.create(:volunteer, user: @coach_bt1_user, team: @boy_1, role: "Coach", first_name: "Coach", last_name: "Bt1", email: "coach@bt1.com")
      @coach_bt2 = FactoryGirl.create(:volunteer, user: @coach_bt2_user, team: @boy_2, role: "Coach", first_name: "Coach", last_name: "Bt2", email: "coach@bt2.com")
      @coach_gt1 = FactoryGirl.create(:volunteer, user: @coach_gt1_user, team: @girl_1, role: "Coach", first_name: "Coach", last_name: "Gt1", email: "coach@gt1.com")
      @coach_gt2 = FactoryGirl.create(:volunteer, user: @coach_bt1_user, team: @girl_2, role: "Coach", first_name: "Coach", last_name: "Gt2", email: "coach@gt2.com")
      @volunteer = FactoryGirl.create(:volunteer, user: @volunteer_user, email: "volunteer@volunteer.com")
      # @admin = FactoryGirl.create(:volunteer, user: @admin_user, role: "Administrator", first_name: "Admin", last_name: "Admin", email: "admin@admin.com")
      #NOTE: ^ Not sure why this one can't be created
    end

    def remove_volunteers
      @coach_bt1.destroy
      @coach_bt2.destroy
      @coach_gt1.destroy
      @coach_gt2.destroy
      @volunteer.destroy
      # @admin.destroy
    end

  end
end
