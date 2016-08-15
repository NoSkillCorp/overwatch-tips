require 'test_helper'

class GamingObjectsControllerTest < ActionController::TestCase
  setup do
    @gaming_object = gaming_objects(:one)
  end

  test "should get index" do
    get :index, params: { type: "Character" }
    assert_response :success
  end
  
  test "should show gaming_object" do
    get :show, params: { id: @gaming_object, type: "Character" }
    assert_response :success
  end

end
