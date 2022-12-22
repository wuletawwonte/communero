require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Wuletaw", last_name: "Wonte", email: "wuletaw@gmail.com", password: "12345678")
  end

  test "valid user" do
    assert @user.valid?
  end

  test "invalid without first_name" do
    @user.first_name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:first_name]
  end

  test "invalid without last_name" do
    @user.last_name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:last_name]
  end

  test "invalid without email" do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:email]
  end

  test "valid without admin boolean value" do
    @user.admin = nil
    assert @user.valid?
  end

end
