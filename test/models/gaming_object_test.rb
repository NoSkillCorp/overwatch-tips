require 'test_helper'

class GamingObjectTest < ActiveSupport::TestCase
  
  test "should have STI map & character" do
    Map.create(name: "mymap", description: "test")
    Character.create(name: "mycharacter", description: "test")
    assert_equal ["mymap"], GamingObject.where(type: "Map").pluck(:name)
    assert_equal ["mycharacter"], GamingObject.where(type: "Character").pluck(:name)
  end

end
