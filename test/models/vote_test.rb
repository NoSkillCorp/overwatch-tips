require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "belongs_to tip" do
    character = Character.create(name: "mymap", description: "test")
    tip = Tip.create(title: "mytip", description: "test", gaming_object: character, category: "as")
    vote = Vote.create(weight: -1, tip: tip)
    assert_equal tip, vote.tip
  end
  
  test "positives scope" do
    character = Character.create(name: "mymap", description: "test")
    tip = Tip.create(title: "mytip", description: "test", gaming_object: character, category: "as")
    vote = Vote.create(weight: -1, tip: tip)
    vote = Vote.create(weight: -1, tip: tip)
    vote = Vote.create(weight: 1, tip: tip)
    vote = Vote.create(weight: 1, tip: tip)
    
    assert_equal [-1, -1], tip.votes.negatives.pluck(:weight)
    assert_equal [1, 1], tip.votes.positives.pluck(:weight)
  end
end
