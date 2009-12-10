# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  ActionView::Base.default_form_builder = SimpleFormBuilder
  
  # Call this to set the id of the body tag for the current page.
  def page_id(page_id = nil)
    @page_id ||= page_id
    @page_id || "generic_page"
  end
  
  # Call this to set the title of the current page.
  def page_title(page_title = nil)
    @page_title ||= page_title
    @page_title.nil? ? "Carers: #{action_name}" : "#{@page_title} @ Lort Smith"
  end
  
  def object_icon(o)
    link_to((image_tag o.image.url(:icon), :alt => o.name, :title => o.name), [:admin, o])
  end
  
  def object_subtitle(o)
    o.subtitle rescue nil 
  end
  
end
