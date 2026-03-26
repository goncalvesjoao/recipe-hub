module ApplicationHelper
  def active_link_to(name, path, html_options = {})
    if current_page?(path)
      html_options[:aria] ||= {}
      html_options[:aria][:current] = 'page'
    end

    link_to(name, path, html_options)
  end
end
