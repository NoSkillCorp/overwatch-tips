require 'test_helper'

class MetaCharacterTest < ActiveSupport::TestCase
  
  test "GamingObject attributes" do
    meta_character = MetaCharacter.new
    assert_respond_to meta_character, :strong_character_id
    assert_respond_to meta_character, :weak_character_id
  end
  
  test "belongs_to strong_characters" do
    character = GamingObject.create(name: 'coco', description:'asticot', type: 'Character', image_path:"test.png")
    character2 = GamingObject.create(name: 'sanglier', description:'cornouaille', type: 'Character', image_path:"test.png")
    testMeta = MetaCharacter.create(strong_character: character, weak_character_id: character2.id)
    assert_equal(character, testMeta.strong_character)
  end
  
  test "belongs_to weak_characters" do
    character = GamingObject.create(name: 'coco', description:'asticot', type: 'Character', image_path:"test.png")
    character2 = GamingObject.create(name: 'sanglier', description:'cornouaille', type: 'Character', image_path:"test.png")
    testMeta = MetaCharacter.create(strong_character_id: character.id, weak_character: character2)
    assert_equal(character2, testMeta.weak_character)
  end
end
