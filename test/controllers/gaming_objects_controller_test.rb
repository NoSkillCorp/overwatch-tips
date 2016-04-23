require 'test_helper'

class GamingObjectsControllerTest < ActionController::TestCase
  setup do
    @gaming_object = gaming_objects(:one)
  end

  test "should get index" do
    get :index, type: "Character"
    assert_response :success
    assert_not_nil assigns(:gaming_objects)
  end
  
  test "should show gaming_object" do
    get :show, id: @gaming_object, type: "Character"
    assert_response :success
  end

end
