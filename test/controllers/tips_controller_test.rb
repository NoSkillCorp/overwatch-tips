require 'test_helper'

class TipsControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
  
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

    cookies["user_id"] = user.user_cookie
    post :update, params: { id: tip.id, tip: { description: "ratata"} }
    assert_equal "ratata", Tip.find(tip.id).description
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
    user = User.create
    tip = Tip.create(description: "bla", category: "as", gaming_object: @character, user: user)
    assert_equal 0, tip.score

    set_user_cookies(user.user_cookie)
    #ap "1: #{request.cookies["user_id"]}"
    post :downvote, params: { id: tip.id }
    assert_equal (-1), tip.score
    
    user2 = User.create
    set_user_cookies(user2.user_cookie)
    #ap "2: #{request.cookies["user_id"]}"
    post :downvote, params: { id: tip.id }
    assert_equal (-2), Tip.find(tip.id).score
    
    user3 = User.create
    set_user_cookies(user3.user_cookie)
    #ap "3: #{request.cookies["user_id"]}"
    post :upvote, params: { id: tip.id }
    assert_equal (-1), Tip.find(tip.id).score
  end
  
  def set_user_cookies(new_cookie)
    #delete cookie "user_id"
    cookies.delete("user_id")
    #set new cookie
    request.cookies["user_id"] = new_cookie
  end
  
end
