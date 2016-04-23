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

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create gaming_object" do
  #   assert_difference('GamingObject.count') do
  #     post :create, gaming_object: { description: @gaming_object.description, name: @gaming_object.name, type: @gaming_object.type }
  #   end

  #   assert_redirected_to gaming_object_path(assigns(:gaming_object))
  # end


  # test "should get edit" do
  #   get :edit, id: @gaming_object
  #   assert_response :success
  # end

  # test "should update gaming_object" do
  #   patch :update, id: @gaming_object, gaming_object: { description: @gaming_object.description, name: @gaming_object.name, type: @gaming_object.type }
  #   assert_redirected_to gaming_object_path(assigns(:gaming_object))
  # end

  # test "should destroy gaming_object" do
  #   assert_difference('GamingObject.count', -1) do
  #     delete :destroy, id: @gaming_object
  #   end

  #   assert_redirected_to gaming_objects_path
  # end
end
