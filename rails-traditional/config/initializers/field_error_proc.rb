ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html_tag.insert(html_tag.index('>'), ' aria-invalid=true')

  html_tag.html_safe
end
