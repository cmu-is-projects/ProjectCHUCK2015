require 'test_helper'

class RosterSpotsControllerTest < ActionController::TestCase
  setup do
    @roster_spot = roster_spots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roster_spots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roster_spot" do
    assert_difference('RosterSpot.count') do
      post :create, roster_spot: { end_date: @roster_spot.end_date, position: @roster_spot.position, start_date: @roster_spot.start_date, student_id: @roster_spot.student_id, team_id: @roster_spot.team_id }
    end

    assert_redirected_to roster_spot_path(assigns(:roster_spot))
  end

  test "should show roster_spot" do
    get :show, id: @roster_spot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @roster_spot
    assert_response :success
  end

  test "should update roster_spot" do
    patch :update, id: @roster_spot, roster_spot: { end_date: @roster_spot.end_date, position: @roster_spot.position, start_date: @roster_spot.start_date, student_id: @roster_spot.student_id, team_id: @roster_spot.team_id }
    assert_redirected_to roster_spot_path(assigns(:roster_spot))
  end

  test "should destroy roster_spot" do
    assert_difference('RosterSpot.count', -1) do
      delete :destroy, id: @roster_spot
    end

    assert_redirected_to roster_spots_path
  end
end
