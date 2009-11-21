ActionController::Routing::Routes.draw do |map|

  map.namespace :admin do |admin|
    admin.resources :volunteers, :collection => { :map => :get, :search => :get }
    admin.root :controller => 'volunteers'
  end
  
  map.resources :home
  map.resources :volunteers, :only => [:new, :create]
  map.connect '/search', :controller => 'volunteers', :action => 'search'
  
  map.root :controller => "volunteers", :action => "new"
  
end
