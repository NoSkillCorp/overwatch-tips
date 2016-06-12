require 'test_helper'

class TipsControllerTest < ActionController::TestCase
  setup do
    @character = Character.create(name: "mycharac", description: "test")
  end
  
  test "should create tip" do
    assert_difference('Tip.count') do
      post :create, tip: { description: "test", gaming_object_id: @character.id, category: "as" }
    end
  end
  
  test "should update tip" do
    user = User.create
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character, user: user)
    assert_equal "bla", tip.description
    post :update, id: tip.id, description: "ratata"
    assert_equal "ratata", tip.description
    
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
  
  test "should change vote score" do
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character)
    assert_equal 0, tip.score
    post :upvote, id: tip.id
    assert_equal 1, tip.score
    post :downvote, id: tip.id
    assert_equal (-1), tip.score
  end
  
  test "several people should be able to vote" do
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character)
    assert_equal 0, tip.score
    post :downvote, id: tip.id
    assert_equal (-1), tip.score
    user2 = User.create
    cookies["user_id"] = user2.user_cookie
    post :downvote, id: tip.id
    assert_equal (-2), tip.score
    user3 = User.create
    cookies["user_id"] = user3.user_cookie
    post :upvote, id: tip.id
    assert_equal (-1), tip.score
  end
  
end
