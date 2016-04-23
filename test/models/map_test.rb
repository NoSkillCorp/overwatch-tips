require 'test_helper'

class MapTest < ActiveSupport::TestCase
  test "has_many tips" do
    map = Map.create(name: "mymap")
    map.tips.build(description: "tip1", title: "title1")
    map.tips.build(description: "tip2", title: "title2")
    assert_equal ["tip1", "tip2"], map.tips.map(&:description)
  end
end
