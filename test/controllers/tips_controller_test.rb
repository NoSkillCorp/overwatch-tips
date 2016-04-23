require 'test_helper'

class TipsControllerTest < ActionController::TestCase
  setup do
    @tip = tips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tip" do
    assert_difference('Tip.count') do
      post :create, tip: { description: @tip.description, title: @tip.title }
    end

    assert_redirected_to tip_path(assigns(:tip))
  end

  test "should show tip" do
    get :show, id: @tip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tip
    assert_response :success
  end

  test "should update tip" do
    patch :update, id: @tip, tip: { description: @tip.description, title: @tip.title }
    assert_redirected_to tip_path(assigns(:tip))
  end

  test "should destroy tip" do
    assert_difference('Tip.count', -1) do
      delete :destroy, id: @tip
    end

    assert_redirected_to tips_path
  end
end
