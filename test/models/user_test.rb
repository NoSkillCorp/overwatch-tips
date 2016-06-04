require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has many votes" do
    user = User.create
    vote = Vote.create(user: user)
    assert_equal user.user_cookie, vote.user_cookie
    assert_equal [vote], user.votes.to_a
  end
  
  test "assign user_cookie before save" do
    user = User.create
    assert_not_nil user.user_cookie
    assert_not_nil user.user_cookie
  end

  test "generate_new_user_cookie" do
    user_cookie = User.generate_new_user_cookie.length
    assert_equal Fixnum, user_cookie.class
    assert_equal 32, user_cookie
  end
end
