require 'test_helper'

class Api::GamingObjectsControllerTest < ActionController::TestCase
  setup do
    @gaming_object = gaming_objects(:one)
  end
  
  test "should show gaming_object" do
    get :show, params: { id: @gaming_object.slug, type: "Character" }
    assert_response :success
    assert_equal ["id", "type", "name", "image_src", "slug", "description", "best_tip"], JSON.parse(@response.body).keys
  end

  test "should get index" do
    get :index, params: { type: "Character" }
    assert_response :success
    assert_equal Character.count, JSON.parse(@response.body).length
  end

end
