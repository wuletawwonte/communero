require "test_helper"

class SubCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_comment = sub_comments(:one)
  end

  test "should get index" do
    get sub_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_comment_url
    assert_response :success
  end

  test "should create sub_comment" do
    assert_difference("SubComment.count") do
      post sub_comments_url, params: { sub_comment: {  } }
    end

    assert_redirected_to sub_comment_url(SubComment.last)
  end

  test "should show sub_comment" do
    get sub_comment_url(@sub_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_comment_url(@sub_comment)
    assert_response :success
  end

  test "should update sub_comment" do
    patch sub_comment_url(@sub_comment), params: { sub_comment: {  } }
    assert_redirected_to sub_comment_url(@sub_comment)
  end

  test "should destroy sub_comment" do
    assert_difference("SubComment.count", -1) do
      delete sub_comment_url(@sub_comment)
    end

    assert_redirected_to sub_comments_url
  end
end
