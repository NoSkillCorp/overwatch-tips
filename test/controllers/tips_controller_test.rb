require 'test_helper'

class TipsControllerTest < ActionController::TestCase
  setup do
    @tip = tips(:one)
  end

  test "should create tip" do
    character = Character.create(name: "mycharac", description: "test")
    assert_difference('Tip.count') do
      post :create, tip: { description: "test", title: "mytitle", gaming_object_id: character.id, category: "as"}
    end
    
    # assert_equal("mytitle", JSON.parse(response.body)["title"])
    # assert_equal(character.id, JSON.parse(response.body)["gaming_object_id"])
    # assert_equal("as", JSON.parse(response.body)["category"])
  end
 
end
