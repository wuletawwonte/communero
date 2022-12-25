# frozen_string_literal: true

class GroupFilterComponent < ViewComponent::Base
  attr_accessor :title, :link
  def initialize(title:, link: )
    @title = title
    @link = link
  end
end
