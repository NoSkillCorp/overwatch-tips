require 'test_helper'

class TipTest < ActiveSupport::TestCase
  test "belongs_to gaming_object" do
    map = Map.create(name: "mymap", description: "test")
    tip = Tip.create(title: "mytip", description: "test", gaming_object: map)
    assert_equal map, tip.gaming_object
  end
end
