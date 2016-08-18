require 'test_helper'

class Api::TipsControllerTest < ActionController::TestCase

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
  
end
