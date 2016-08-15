require 'test_helper'

class TipsControllerTest < ActionController::TestCase
  setup do
    @character = Character.create(name: "mycharac", description: "test")
  end
  
  test "should create tip" do
    assert_difference('Tip.count') do
      post :create, params: { tip: { description: "test", gaming_object_id: @character.id, category: "as" } }
    end
  end
  
  test "should update tip" do
    user = User.create
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character, user: user)
    assert_equal "bla", tip.description
    post :update, params: { id: tip.id, description: "ratata" }, session: { cookies: { user_id: user.user_cookie } }
    assert_equal "ratata", tip.description
    
  end
  
  test "should upvote tip" do
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character)
    assert_difference('Vote.count', 1) do
      post :upvote, params: { id: tip.id }
    end
  end
  
  test "should downvote tip" do
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character)
    assert_difference('Vote.count', 1) do
      post :downvote, params: { id: tip.id }
    end
  end
  
  test "should change vote score" do
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character)
    assert_equal 0, tip.score
    post :upvote, params: { id: tip.id }
    assert_equal 1, tip.score
    post :downvote, params: { id: tip.id }
    assert_equal (-1), tip.score
  end
  
  test "several people should be able to vote" do
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character)
    assert_equal 0, tip.score
    post :downvote, params: { id: tip.id }
    assert_equal (-1), tip.score
    user2 = User.create
    cookies["user_id"] = user2.user_cookie
    post :downvote, params: { id: tip.id }, cookies: { user_id: user2.user_cookie }
    assert_equal (-2), tip.score
    user3 = User.create
    cookies["user_id"] = user3.user_cookie
    post :upvote, params: { id: tip.id },  cookies: { user_id: user3.user_cookie }
    assert_equal (-1), tip.score
  end
  
end
