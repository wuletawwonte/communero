require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @valid_post = posts(:valid)
    @post_one = posts(:one)
  end

  test 'valid post' do
    assert @valid_post.valid?
  end

  test 'invalid without title' do
    @valid_post.title = nil
    refute @valid_post.valid?
    assert_not_nil @valid_post.errors[:title]
  end

  test 'invalid without body' do
    @valid_post.body = nil
    refute @valid_post.valid?
    assert_not_nil @valid_post.errors[:body]
  end

  test 'valid without status' do
    @valid_post.status = nil
    assert @valid_post.valid?
  end

  test 'post has many comments' do
    assert_equal 2, @post_one.comments.size
  end
end
