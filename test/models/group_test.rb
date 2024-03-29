# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  user_id     :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  def setup
    @valid_group = groups(:valid)
    @group_one = groups(:one)
  end

  test 'valid group' do
    refute @valid_group.valid?
  end

  test 'invalid without name' do
    @valid_group.name = nil
    refute @valid_group.valid?
    assert_not_nil @valid_group.errors[:name]
  end

  test 'valid without description' do
    @valid_group.description = nil
    refute @valid_group.valid?
  end

  test 'user has many users' do
    assert_equal 1, @group_one.users.size
  end

  test 'user has many posts' do
    assert_equal 2, @group_one.posts.size
  end
end
