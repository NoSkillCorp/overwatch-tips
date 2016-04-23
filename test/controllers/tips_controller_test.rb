require 'test_helper'

class TipsControllerTest < ActionController::TestCase
  setup do
    @tip = tips(:one)
  end

  test "should create tip" do
    character = Character.create(name: "mycharac", description: "test")
    assert_difference('Tip.count') do
      post :create, tip: { description: "test", gaming_object_id: character.id, category: "as"}
    end
  end
 
end
