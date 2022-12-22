require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "valid user" do
    user = users(:one)

    assert user.valid?
  end

end
