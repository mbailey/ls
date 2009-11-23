module AnimalsHelper
  def animal_icon(a)
    a.class == Animal &&  link_to((image_tag a.avatar.url(:icon), :alt => a.name, :title => a.name), [:admin, a])
  end
  
  def animal_details(a)
    a.class == Animal && "#{a.kind} #{a.name} [#{a.identifier}]"
  end
  
end
