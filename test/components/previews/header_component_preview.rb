class HeaderComponentPreview < ViewComponent::Preview
  def with_header
    render(HeaderComponent.new(title: 'Groups'))
  end
end
