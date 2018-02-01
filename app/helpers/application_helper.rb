module ApplicationHelper
  def page_is_active(path)
    params[:controller] == path ? 'active' : ''
  end
end
