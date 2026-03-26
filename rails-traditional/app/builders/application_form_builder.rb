class ApplicationFormBuilder < ActionView::Helpers::FormBuilder
  # Define an array of standard form helpers to override
  %w(text_field text_area select password_field).each do |helper_method|
    define_method(helper_method) do |method, options = {}|
      if object&.errors&.include?(helper_method.to_sym)
        options[:aria] ||= {}
        options[:aria][:invalid] = true
      end

      # Call the original helper method using 'super' and add custom logic
      super(method, options) + error_message_for(method)
    end
  end

  def error_message_for(method)
    if object.errors.include?(method)
      # Use content_tag to generate the desired HTML for the error message
      @template.content_tag(:small, object.errors[method].first, class: 'error-message')
    else
      ''
    end
  end
end
