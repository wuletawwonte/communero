class UserIconComponent < ViewComponent::Base
  attr_accessor :initial, :size, :color

  def initialize(initial:, color: 'blue', size: 8)
    @initial = initial
    @color = color
    @size = size
  end
end
