require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  def setup
    @user_a= User.create  
  end
  
  test "Vote attributes" do
    vote = Vote.new
    assert_respond_to vote, :tip_id
    assert_respond_to vote, :weight
    assert_respond_to vote, :user_id
  end
  
  test "belongs_to tip" do
    character = Character.create(name: "mymap", description: "test")
    tip = Tip.create(title: "mytip", description: "test", gaming_object: character, category: "as")
    vote = Vote.create(weight: -1, tip: tip, user: @user_a)
    assert_equal tip, vote.tip
  end
  
  test "positives scope" do
    character = Character.create(name: "mymap", description: "test")
    tip = Tip.create(title: "mytip", description: "test", gaming_object: character, category: "as")
    vote = Vote.create(weight: -1, tip: tip, user: @user_a)
    vote = Vote.create(weight: -1, tip: tip, user: User.create)
    vote = Vote.create(weight: 1, tip: tip, user: User.create)
    vote = Vote.create(weight: 1, tip: tip, user: User.create)
    
    assert_equal [-1, -1], tip.votes.negatives.pluck(:weight)
    assert_equal [1, 1], tip.votes.positives.pluck(:weight)
  end
end
