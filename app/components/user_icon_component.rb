class UserIconComponent < ViewComponent::Base
  attr_accessor :initial, :size, :color, :text_size

  def initialize(initial:, color: 'blue', size: 8, text_size: "text-xs")
    @initial = initial
    @color = color
    @size = size
    @text_size = text_size
  end
end
