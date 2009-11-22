ActionController::Routing::Routes.draw do |map|
  map.resources :placements

  map.resource :user_session

  map.namespace :admin do |admin|
    admin.resources :volunteers, :collection => { :pending => :get, :map => :get} do |volunteer|
      volunteer.resource :interview
    end
    admin.resources :placements
    admin.root :controller => 'volunteers'
  end

  map.resources :home
  map.resources :volunteers, :only => [:new, :create]
  map.connect '/search', :controller => 'volunteers', :action => 'search'

  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'

  map.root :controller => "volunteers", :action => "new"

end
