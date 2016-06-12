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
  
  test "has_many weaker_meta_characters" do
    character = GamingObject.create(name: 'coco', description:'asticot', type: 'Character', image_path:"test.png")
    character2 = GamingObject.create(name: 'sanglier', description:'cornouaille', type: 'Character', image_path:"test.png")
    character3 = GamingObject.create(name: 'hodor', description:'hodor', type: 'Character', image_path:"test.png")
    
    meta1 = MetaCharacter.create(strong_character:character, weak_character:character2)
    meta2 = MetaCharacter.create(strong_character:character, weak_character:character3)
    assert_equal [meta1, meta2], character.weaker_meta_characters.to_a
  end
  
  test "has_many stronger_meta_characters" do
    character = GamingObject.create(name: 'coco', description:'asticot', type: 'Character', image_path:"test.png")
    character2 = GamingObject.create(name: 'sanglier', description:'cornouaille', type: 'Character', image_path:"test.png")
    character3 = GamingObject.create(name: 'hodor', description:'hodor', type: 'Character', image_path:"test.png")
    
    meta1 = MetaCharacter.create(strong_character:character2, weak_character:character)
    meta2 = MetaCharacter.create(strong_character:character3, weak_character:character)
    assert_equal [meta1, meta2], character.stronger_meta_characters.to_a
  end
  
  test "has_many weaker_character" do
    character = GamingObject.create(name: 'coco', description:'asticot', type: 'Character', image_path:"test.png")
    character2 = GamingObject.create(name: 'sanglier', description:'cornouaille', type: 'Character', image_path:"test.png")
    character3 = GamingObject.create(name: 'hodor', description:'hodor', type: 'Character', image_path:"test.png")
    
    MetaCharacter.create(strong_character:character, weak_character:character2)
    MetaCharacter.create(strong_character:character, weak_character:character3)
    
    assert_equal [character2, character3], character.weaker_characters.to_a
  end
  
  test "has_many stronger_character" do
    character = GamingObject.create(name: 'coco', description:'asticot', type: 'Character', image_path:"test.png")
    character2 = GamingObject.create(name: 'sanglier', description:'cornouaille', type: 'Character', image_path:"test.png")
    character3 = GamingObject.create(name: 'hodor', description:'hodor', type: 'Character', image_path:"test.png")
    
    MetaCharacter.create(strong_character:character2, weak_character:character)
    MetaCharacter.create(strong_character:character3, weak_character:character)
    
    assert_equal [character2, character3], character.stronger_characters.to_a
  end

end
