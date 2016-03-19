module ApplicationHelper

  def nav_link_active?(path)
    current_page?(path) ? true : false
  end
  
end
