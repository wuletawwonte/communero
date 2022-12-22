require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user_one = users(:one)
    @valid_user = users(:valid)
  end

  test "valid user" do
    assert @valid_user.valid?
  end

  test "invalid without first_name" do
    @valid_user.first_name = nil
    refute @valid_user.valid?
    assert_not_nil @valid_user.errors[:first_name]
  end

  test "invalid without last_name" do
    @valid_user.last_name = nil
    refute @valid_user.valid?
    assert_not_nil @valid_user.errors[:last_name]
  end

  test "invalid without email" do
    @valid_user.email = nil
    refute @valid_user.valid?
    assert_not_nil @valid_user.errors[:email]
  end

  test "valid without admin boolean value" do
    @valid_user.admin = nil
    assert @valid_user.valid?
  end

  test "user has many groups" do
    assert_equal 2, @user_one.groups.size 
  end

  test "user has many posts" do
    assert_equal 2, @user_one.posts.size 
  end

  test "user has many comments" do
    assert_equal 2, @user_one.comments.size 
  end

end
