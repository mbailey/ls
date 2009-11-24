ActionController::Routing::Routes.draw do |map|
  map.resources :animals

  map.resource :user_session

  map.namespace :admin do |admin|
    admin.resources :home_checks, :only => [:index, :show, :update, :edit, :destroy]
    admin.resources :animals
    admin.resources :carers, :collection => { :pending => :get, :map => :get} do |carer|
      carer.resource :interview
      carer.resource :home_check
    end
    admin.resources :placements, :collection => { :search => :get }
    admin.root :controller => 'carers'
  end

  map.resources :home
  map.resources :carers, :only => [:new, :create]
  map.connect '/search', :controller => 'carers', :action => 'search'

  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'

  map.root :controller => "carers", :action => "new"
end
