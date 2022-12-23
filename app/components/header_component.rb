class HeaderComponent < ViewComponent::Base
  attr_accessor :title

  def initialize(title:)
    @title = title
  end
end
