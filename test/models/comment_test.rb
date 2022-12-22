require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @valid_comment = comments(:valid)
    @comment_one = comments(:one)
  end

  test "valid comment" do
    assert @valid_comment.valid?
  end

  test "invalid without content" do
    @valid_comment.content = nil
    refute @valid_comment.valid?
    assert_not_nil @valid_comment.errors[:content]
  end

  test "comment has many sub comments" do
    assert_equal 2, @comment_one.sub_comments.size 
  end

end
