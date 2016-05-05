require 'test_helper'

class GamingObjectTest < ActiveSupport::TestCase
  
  test "GamingObject attributes" do
    gaming_object = GamingObject.new
    assert_respond_to gaming_object, :name
    assert_respond_to gaming_object, :description
    assert_respond_to gaming_object, :type
    assert_respond_to gaming_object, :image_path
  end
  
  test "should have STI map & character" do
    Map.create(name: "mymap", description: "test")
    Character.create(name: "mycharacter", description: "test")
    assert_equal ["mymap"], GamingObject.where(type: "Map").pluck(:name)
    assert_equal ["Zenyatta", "Bastion", "mycharacter"], GamingObject.where(type: "Character").pluck(:name)
  end
  
  test "has_many tips" do
    map = Map.create(name: "mymap", description: "test")
    map.tips.build(description: "test", category: "as").save
    map.tips.build(description: "retest", category: "as").save
    assert_equal ["test", "retest"], map.tips.pluck(:description)
  end

end
