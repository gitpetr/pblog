module ApplicationHelper
  def icon(classes, title = nil, style = nil)
    content_tag(:i, '', class: "fa #{classes}", title: title, style: style)
  end

  def noty_type(name)
    name == 'notice' ? 'success' : 'error'
  end
end
