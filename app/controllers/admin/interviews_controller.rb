class Admin::InterviewsController < Admin::BaseController

  def edit
    @signup = Signup.find(params[:signup_id])
  end
  
  def update
    @signup = Signup.find(params[:signup_id])
    @signup.attributes = params[:signup]
    if @signup.completing_interview?
      @signup.interview_user_id = current_user.id
    end
    
    respond_to do |format|
      if @signup.save
        flash[:notice] = 'Interview was successfully updated.'
        format.html { redirect_to(admin_signups_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @signup.errors, :status => :unprocessable_entity }
      end
    end
    
  end 

end