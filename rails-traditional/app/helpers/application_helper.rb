module ApplicationHelper
  def active_link_to(name, path, html_options = {})
    active_class = current_page?(path) ? 'active' : ''
    html_options[:class] = [html_options[:class], active_class].compact.join(' ')
    link_to(name, path, html_options)
  end
end
