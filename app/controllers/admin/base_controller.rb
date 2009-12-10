class Admin::BaseController < ApplicationController
  # before_filter :require_admin
  
  before_filter :require_user

  layout 'admin'
  
  before_filter :set_page_id
  
  def set_page_id
    @page_id = controller_name.downcase.sub('controller','')
  end  
  
end
