ActionController::Routing::Routes.draw do |map|
  map.resources :animals

  map.resource :user_session

  map.namespace :admin do |admin|
    admin.resources :home_checks, :only => [:index, :show, :update, :edit, :destroy]
    admin.resources :animals
    admin.resources :volunteers, :collection => { :pending => :get, :map => :get} do |volunteer|
      volunteer.resource :interview
      volunteer.resource :home_check
    end
    admin.resources :placements, :collection => { :search => :get }
    admin.root :controller => 'volunteers'
  end

  map.resources :home
  map.resources :volunteers, :only => [:new, :create]
  map.connect '/search', :controller => 'volunteers', :action => 'search'

  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'

  map.root :controller => "volunteers", :action => "new"
end
