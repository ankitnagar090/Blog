class CustomBuilder < ActionView::Helpers::FormBuilder
  def block_text_field(method, options={})
    label(attribute) + super
  end
end
