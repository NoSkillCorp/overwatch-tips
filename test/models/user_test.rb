require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has many votes" do
    user = User.create
    vote = Vote.create(user: user)
    assert_equal user.id, vote.user_id
    assert_equal [vote], user.votes.to_a
  end
  
  test "assign user_cookie before save" do
    user = User.create
    assert_not_nil user.user_cookie
  end

  test "generate_new_user_cookie" do
    user_cookie = User.generate_new_user_cookie.length
    assert_equal Fixnum, user_cookie.class
    assert_equal 32, user_cookie
  end
  
  test "if user is registered, email should be present" do
    user = User.create(is_registered: true, email: nil, password: "123456789", password_confirmation: "123456789")
    assert_equal({email: ["is missing"]}, user.errors.messages)
  end
  
  test "if user is registered, email should be valid" do
    user = User.create(is_registered: true, email: "bad mail", password: "123456789", password_confirmation: "123456789")
    assert_equal({:email=>["is invalid"]}, user.errors.messages)
  end
  
  test "if user is registered, email should not be already used" do
    #first, create a user with an email
    existing_user = User.create(is_registered: true, email: "caca@bite.com", password: "123456789", password_confirmation: "123456789")
    assert_not_nil existing_user.id
    
    #then check if we can create another user with the same email
    user = User.create(is_registered: true, email: "caca@bite.com", password: "123456789", password_confirmation: "123456789")
    assert_equal({:email=>["is already used"]}, user.errors.messages)
  end
  
  test "if the user is registered, password sould be present" do
    user = User.create(is_registered: true, email: "caca@bite.com")
    assert_equal({:password=>["is missing"]}, user.errors.messages)
  end
  
  test "if the user is registered, password should equal password_confirmation" do
    user = User.create(is_registered: true, email: "caca@bite.com", password: "123456789", password_confirmation: "23")
    assert_equal({:password_confirmation=>["is invalid"]}, user.errors.messages)
  end
  
  test "if the user is registered, password sould be between 8 and 128 characters" do
    user = User.create(is_registered: true, email: "caca@bite.com", password: "2", password_confirmation: "2")
    assert_equal({:password=>["should be between 6 and 128 characters"]}, user.errors.messages)
  end
  
  test "register should update a user with email & encrypted password" do
    user = User.create(ip_adress: "123.132.12.56", user_agent: "blah")
    assert user.persisted?
    user.register(email: "dev@test.com", password: "123456", password_confirmation: "123456")
    
    persisted_user = User.find(user.id)
    assert_equal "dev@test.com", persisted_user.email
    assert persisted_user.encrypted_password.present?
    assert persisted_user.is_registered
  end
end
