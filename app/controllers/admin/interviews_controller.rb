class Admin::InterviewsController < Admin::BaseController

  def edit
    @carer = Carer.find(params[:carer_id])
  end
  
  def update
    @carer = Carer.find(params[:carer_id])
    @carer.attributes = params[:carer]
    if @carer.completing_interview?
      @carer.interview_user_id = current_user.id
    end
    
    respond_to do |format|
      if @carer.save
        flash[:notice] = 'Carer was successfully updated.'
        format.html { redirect_to(pending_admin_carers_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @carer.errors, :status => :unprocessable_entity }
      end
    end
    
  end 

end