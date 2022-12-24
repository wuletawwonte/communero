require 'application_system_test_case'

class SubCommentsTest < ApplicationSystemTestCase
  setup do
    @sub_comment = sub_comments(:one)
  end

  test 'visiting the index' do
    visit sub_comments_url
    assert_selector 'h1', text: 'Sub comments'
  end

  test 'should create sub comment' do
    visit sub_comments_url
    click_on 'New sub comment'

    click_on 'Create Sub comment'

    assert_text 'Sub comment was successfully created'
    click_on 'Back'
  end

  test 'should update Sub comment' do
    visit sub_comment_url(@sub_comment)
    click_on 'Edit this sub comment', match: :first

    click_on 'Update Sub comment'

    assert_text 'Sub comment was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Sub comment' do
    visit sub_comment_url(@sub_comment)
    click_on 'Destroy this sub comment', match: :first

    assert_text 'Sub comment was successfully destroyed'
  end
end
