module ApplicationHelper
  def page_is_active(path)
    params[:controller] == path ? 'active' : ''
  end

  def errors_list(object, field_name)
    object.errors.messages[field_name]
  end
end
