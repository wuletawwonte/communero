require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "valid user" do
    user = users(:one)
    assert user.valid?
  end

  test "invalid without first_name" do
    user = User.new(first_name: "Wuletaw", last_name: "Wonte", email: "wuletawwonte@gmail.com", role: "user", password: "12345678")
    refute user.valid?
    assert_not_nil user.errors[:first_name]
  end

  test "invalid without last_name" do
    user = User.new(first_name: "Wonte", email: "wuletawwonte@gmail.com", role: "user", password: "12345678")
    refute user.valid?
    assert_not_nil user.errors[:last_name]
  end

  test "invalid without email" do
    user = User.new(first_name: "Wonte", last_name: "Wonte", role: "user", password: "12345678")
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

end
