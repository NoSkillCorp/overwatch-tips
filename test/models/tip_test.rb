require 'test_helper'

class TipTest < ActiveSupport::TestCase
  
  test "Tip attributes" do
    tip = Tip.new
    assert_respond_to tip, :title
    assert_respond_to tip, :description
    assert_respond_to tip, :gaming_object_id
    assert_respond_to tip, :category
  end
  
  test "belongs_to gaming_object" do
    map = Map.create(name: "mymap", description: "test")
    tip = Tip.create(title: "mytip", description: "test", gaming_object: map)
    assert_equal map, tip.gaming_object
  end
  
  test "enum category" do
    map = Character.create(name: "mycharacter", description: "test")
    assert_raises(ArgumentError){
      Tip.create(title: "mytip", description: "test", gaming_object: map, category: "BAD CATEGORY")
    }
    assert_nothing_raised{
      Tip.create(title: "mytip", description: "test", gaming_object: map, category: "against")
    }
  end
end
