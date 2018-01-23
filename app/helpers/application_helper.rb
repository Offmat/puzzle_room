module ApplicationHelper
  def page_is_active(path)
    current_page?(path) ? 'active' : ''
  end
end
