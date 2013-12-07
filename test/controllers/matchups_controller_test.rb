require 'test_helper'

class MatchupsControllerTest < ActionController::TestCase
  setup do
    @matchup = matchups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:matchups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create matchup" do
    assert_difference('Matchup.count') do
      post :create, matchup: { start_time: @matchup.start_time, team1_name: @matchup.team1_name, team1_score: @matchup.team1_score, team1_spread: @matchup.team1_spread, team2_name: @matchup.team2_name, team2_score: @matchup.team2_score, team2_spread: @matchup.team2_spread, week: @matchup.week }
    end

    assert_redirected_to matchup_path(assigns(:matchup))
  end

  test "should show matchup" do
    get :show, id: @matchup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @matchup
    assert_response :success
  end

  test "should update matchup" do
    patch :update, id: @matchup, matchup: { start_time: @matchup.start_time, team1_name: @matchup.team1_name, team1_score: @matchup.team1_score, team1_spread: @matchup.team1_spread, team2_name: @matchup.team2_name, team2_score: @matchup.team2_score, team2_spread: @matchup.team2_spread, week: @matchup.week }
    assert_redirected_to matchup_path(assigns(:matchup))
  end

  test "should destroy matchup" do
    assert_difference('Matchup.count', -1) do
      delete :destroy, id: @matchup
    end

    assert_redirected_to matchups_path
  end
end
