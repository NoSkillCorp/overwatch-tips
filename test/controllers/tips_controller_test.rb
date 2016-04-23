require 'test_helper'

class TipsControllerTest < ActionController::TestCase
  setup do
    @tip = tips(:one)
  end

  test "should create tip" do
    assert_difference('Tip.count') do
      post :create, tip: { description: "test", title: "mytitle" }
    end
    
    assert_equal("mytitle", JSON.parse(response.body)["title"])
  end
 
end
