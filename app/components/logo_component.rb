class LogoComponent < ViewComponent::Base
  attr_accessor :brand

  def initialize(brand: "")
    @brand = brand
  end
end
