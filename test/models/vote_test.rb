require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "Vote attributes" do
    vote = Vote.new
    assert_respond_to vote, :tip_id
    assert_respond_to vote, :weight
    assert_respond_to vote, :user_cookie
  end
  
  test "belongs_to tip" do
    character = Character.create(name: "mymap", description: "test")
    tip = Tip.create(title: "mytip", description: "test", gaming_object: character, category: "as")
    vote = Vote.create(weight: -1, tip: tip, user_cookie: "user_cookie")
    assert_equal tip, vote.tip
  end
  
  test "positives scope" do
    character = Character.create(name: "mymap", description: "test")
    tip = Tip.create(title: "mytip", description: "test", gaming_object: character, category: "as")
    vote = Vote.create(weight: -1, tip: tip, user_cookie: "user_cookie1")
    vote = Vote.create(weight: -1, tip: tip, user_cookie: "user_cookie2")
    vote = Vote.create(weight: 1, tip: tip, user_cookie: "user_cookie3")
    vote = Vote.create(weight: 1, tip: tip, user_cookie: "user_cookie4")
    
    assert_equal [-1, -1], tip.votes.negatives.pluck(:weight)
    assert_equal [1, 1], tip.votes.positives.pluck(:weight)
  end
end
