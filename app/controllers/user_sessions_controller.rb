class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default admin_volunteers_path
    else
      # don't need to hint what part of login failed with errors
      @user_session.errors.clear
      flash[:error] = "Login unsuccessful!"
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy rescue nil
    flash[:notice] = "Logout successful!"
    redirect_to new_user_session_url
  end
end
