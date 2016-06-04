require 'test_helper'

class TipTest < ActiveSupport::TestCase
  
  def setup
    @character = Character.create(name: "mymap", description: "test")
    @user_a= User.create
    @user_b = User.create
    @tip = Tip.create(description: "test", gaming_object: @character, category: "as", user_cookie: @user_a.user_cookie)
  end
  
  test "belongs_to user" do
    assert_equal @user_a, @tip.user
  end
  
  test "Tip attributes" do
    tip = Tip.new
    assert_respond_to tip, :description
    assert_respond_to tip, :gaming_object_id
    assert_respond_to tip, :category
    assert_respond_to tip, :user_cookie
  end
  
  test "belongs_to gaming_object" do
    assert_equal @character, @tip.gaming_object
  end
  
  test "has_many votes" do
    @tip.votes.build(weight: -1, user_cookie: "user_cookie1").save
    @tip.votes.build(weight: -2, user_cookie: "user_cookie2").save
    assert_equal [-1, -2], @tip.votes.pluck(:weight)
  end
  
  test "score" do
    @tip.votes.build(weight: -1, user_cookie: "user_cookie1").save
    @tip.votes.build(weight: -2, user_cookie: "user_cookie2").save
    assert_equal(-3, @tip.score)
  end
  
  test "positive & negative score" do
    @tip.votes.build(weight: -1, user_cookie: "user_cookie1").save
    @tip.votes.build(weight: -1, user_cookie: "user_cookie2").save
    @tip.votes.build(weight: 1, user_cookie: "user_cookie3").save
    @tip.votes.build(weight: 1, user_cookie: "user_cookie4").save
    assert_equal(0, @tip.score)
    assert_equal(2, @tip.positive_score)
    assert_equal(2, @tip.negative_score)
  end
  
  test "upvote" do
    assert_equal 0, @tip.score
    @tip.upvote(@user_a)
    assert_equal 1, @tip.score
    @tip.upvote(@user_a)
    assert_equal 0, @tip.score
    #then downvote changes weight of existing upvote
    @tip.downvote(@user_a)
    assert_equal (-1), @tip.score
  end
  
  test "downvote" do
    assert_equal 0, @tip.score
    @tip.downvote(@user_a)
    assert_equal(-1, @tip.score)
    @tip.downvote(@user_a)
    assert_equal(0, @tip.score)
    #then downvote changes weight of existing upvote
    @tip.upvote(@user_a)
    assert_equal 1, @tip.score
  end
    
  test "is_voted?" do
    @tip.downvote(@user_a)
    assert @tip.is_voted?(@user_a)
    assert_not @tip.is_voted?(@user_b)
  end
  
  test "is_upvoted?" do
    @tip.upvote(@user_a)
    assert @tip.is_upvoted?(@user_a)
    assert_not @tip.is_upvoted?(@user_b)
  end
  
  test "is_downvoted?" do
    @tip.downvote(@user_a)
    assert @tip.is_downvoted?(@user_a)
    assert_not @tip.is_downvoted?(@user_b)
  end
end
