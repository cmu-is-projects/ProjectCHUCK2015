require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registrations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post :create, registration: { active: @registration.active, bracket_id: @registration.bracket_id, family_physician: @registration.family_physician, has_physical: @registration.has_physical, has_proof_of_insurance: @registration.has_proof_of_insurance, has_report_card: @registration.has_report_card, insurance_policy_no: @registration.insurance_policy_no, insurance_provider: @registration.insurance_provider, jersey_size: @registration.jersey_size, physical_date: @registration.physical_date, physician_phone: @registration.physician_phone, student_id: @registration.student_id }
    end

    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should show registration" do
    get :show, id: @registration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration
    assert_response :success
  end

  test "should update registration" do
    patch :update, id: @registration, registration: { active: @registration.active, bracket_id: @registration.bracket_id, family_physician: @registration.family_physician, has_physical: @registration.has_physical, has_proof_of_insurance: @registration.has_proof_of_insurance, has_report_card: @registration.has_report_card, insurance_policy_no: @registration.insurance_policy_no, insurance_provider: @registration.insurance_provider, jersey_size: @registration.jersey_size, physical_date: @registration.physical_date, physician_phone: @registration.physician_phone, student_id: @registration.student_id }
    assert_redirected_to registration_path(assigns(:registration))
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete :destroy, id: @registration
    end

    assert_redirected_to registrations_path
  end
end
