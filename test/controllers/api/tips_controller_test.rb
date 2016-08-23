require 'test_helper'

class Api::TipsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "get a random positive tip" do
    get :random
    assert_response :success
    assert_equal ["id", "category", "playing_sentence", "score", "positive_score", "negative_score", "description", "created_at", "gaming_object"], JSON.parse(@response.body).keys
  end
  
  test "should show the positive tips of a character" do
    get :index, params: { type: "Character", character_id: "zenyatta" }
    assert_response :success
    assert_equal 2, JSON.parse(@response.body).length
  end
  
  test "should filter by category the positive tips of a character" do
    get :index, params: { type: "Character", character_id: "zenyatta", category: "as" }
    assert_response :success
    assert_equal 1, JSON.parse(@response.body).length
  end
  
  test "bad category should make an error response" do
    get :index, params: { type: "Character", character_id: "zenyatta", category: "defense" }
    assert_response :bad_request
    assert_equal({"errors"=>"Bad category argument : defense"}, JSON.parse(@response.body))
  end

  test "bad slug should make an error response" do
    get :index, params: { type: "Character", character_id: "tata"}
    assert_response :bad_request
    assert_equal({"errors"=>"Bad id/slug argument : tata"}, JSON.parse(@response.body))
  end
end
