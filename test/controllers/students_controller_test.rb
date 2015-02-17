require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { active: @student.active, allergies: @student.allergies, cell_phone: @student.cell_phone, dob: @student.dob, email: @student.email, emergency_contact_name: @student.emergency_contact_name, emergency_contact_phone: @student.emergency_contact_phone, first_name: @student.first_name, gender: @student.gender, grade: @student.grade, has_birth_certificate: @student.has_birth_certificate, household_id: @student.household_id, last_name: @student.last_name, medications: @student.medications, security_question: @student.security_question, security_response: @student.security_response }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { active: @student.active, allergies: @student.allergies, cell_phone: @student.cell_phone, dob: @student.dob, email: @student.email, emergency_contact_name: @student.emergency_contact_name, emergency_contact_phone: @student.emergency_contact_phone, first_name: @student.first_name, gender: @student.gender, grade: @student.grade, has_birth_certificate: @student.has_birth_certificate, household_id: @student.household_id, last_name: @student.last_name, medications: @student.medications, security_question: @student.security_question, security_response: @student.security_response }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
