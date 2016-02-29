module Contexts
  module Users

    def create_users
      @admin_user = FactoryGirl.create(:user, username: "admin", role: "admin", email: "admin@admin.com")
      @guardian_user = FactoryGirl.create(:user, username: "guardian", role: "guardian", email: "guardian@guardian.com")
      @coach_bt1_user = FactoryGirl.create(:user, username: "coach_bt1", role: "volunteer", email: "coach@bt1.com")
      @coach_bt2_user = FactoryGirl.create(:user, username: "coach_bt2", role: "volunteer", email: "coach@bt2.com")
      @coach_gt1_user = FactoryGirl.create(:user, username: "coach_gt1", role: "volunteer", email: "coach@gt1.com")
      @coach_gt2_user = FactoryGirl.create(:user, username: "coach_gt2", role: "volunteer", email: "coach@gt2.com")
      @volunteer_user = FactoryGirl.create(:user, username: "volunteer", role: "volunteer", email: "volunteer@volunteer.com")
    end

    def remove_users
      @admin_user.destroy
      @guardian_user.destroy
      @coach_bt1_user.destroy
      @coach_bt2_user.destroy
      @coach_gt1_user.destroy
      @coach_gt2_user.destroy
      @volunteer_user.destroy
    end

  end
end
