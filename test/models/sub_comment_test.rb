# == Schema Information
#
# Table name: sub_comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  comment_id :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class SubCommentTest < ActiveSupport::TestCase
  def setup
    @valid_sub_comment = sub_comments(:valid)
  end

  test 'valid sub comment' do
    assert @valid_sub_comment.valid?
  end

  test 'invalid without content' do
    @valid_sub_comment.content = nil
    refute @valid_sub_comment.valid?
    assert_not_nil @valid_sub_comment.errors[:content]
  end
end
