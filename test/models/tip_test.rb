require 'test_helper'

class TipTest < ActiveSupport::TestCase
  
  def setup
    @character = Character.create(name: "mymap", description: "test")
    @tip = Tip.create(description: "test", gaming_object: @character, category: "as")
  end
  
  test "Tip attributes" do
    tip = Tip.new
    assert_respond_to tip, :description
    assert_respond_to tip, :gaming_object_id
    assert_respond_to tip, :category
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
    @tip.upvote("user_cookie")
    assert_equal 1, @tip.score
  end
  
  test "downvote" do
    assert_equal 0, @tip.score
    @tip.downvote("user_cookie")
    assert_equal(-1, @tip.score)
  end
end
