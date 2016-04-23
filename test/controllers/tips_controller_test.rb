require 'test_helper'

class TipsControllerTest < ActionController::TestCase
  setup do
    @character = Character.create(name: "mycharac", description: "test")
  end

  test "should create tip" do
    assert_difference('Tip.count') do
      post :create, tip: { description: "test", gaming_object_id: @character.id, category: "as"}
    end
  end
  
  test "should upvote tip" do
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character)
    assert_difference('Vote.count', 1) do
      post :upvote, id: tip.id
    end
  end
  
  test "should downvote tip" do
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character)
    assert_difference('Vote.count', 1) do
      post :downvote, id: tip.id
    end
  end
  
end
