class Admin::InterviewsController < Admin::BaseController

  def edit
    @volunteer = Volunteer.find(params[:volunteer_id])
  end
  
  def update
    @volunteer = Volunteer.find(params[:volunteer_id])
    @volunteer.attributes = params[:volunteer]
    if @volunteer.completing_interview?
      @volunteer.interview_user_id = current_user.id
    end
    
    respond_to do |format|
      if @volunteer.save
        flash[:notice] = 'Volunteer was successfully updated.'
        format.html { redirect_to(pending_admin_volunteers_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @volunteer.errors, :status => :unprocessable_entity }
      end
    end
    
  end 

end