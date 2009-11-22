class Admin::BaseController < ApplicationController
  # before_filter :require_admin
  
  before_filter :require_user

  layout 'admin'
  
end
